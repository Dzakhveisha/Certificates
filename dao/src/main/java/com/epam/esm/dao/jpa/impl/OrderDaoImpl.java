package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.OrderDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Order;
import com.epam.esm.dao.model.PageOfEntities;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;

import static com.epam.esm.dao.jpa.BaseDao.pageSize;

@Repository
@AllArgsConstructor
public class OrderDaoImpl implements OrderDao {

    private static final String CERTIFICATE = "certificate";
    private static final String USER = "user";
    private static final String ID = "id";

    @PersistenceContext
    private final EntityManager entityManager;

    @Override
    public PageOfEntities<Order> findAll(long id, int pageNumber) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(criteriaBuilder.equal(root.get(USER).get(ID), id));

        return new PageOfEntities<>(getCountOfPages(id), pageNumber,
                entityManager.createQuery(orderCriteria)
                        .setFirstResult((pageNumber - 1) * pageSize)
                        .setMaxResults(pageSize)
                        .getResultList());
    }

    @Override
    public Order create(Order order) {
        entityManager.persist(order);
        return order;
    }

    public boolean remove(Long userId, Long certificateId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaDelete<Order> criteriaDelete = criteriaBuilder.createCriteriaDelete(Order.class);
        Root<Order> root = criteriaDelete.from(Order.class);

        criteriaDelete.where(criteriaBuilder.equal(root.get(CERTIFICATE).get(ID), certificateId));
        criteriaDelete.where(criteriaBuilder.equal(root.get(USER).get(ID), userId));

        int rowsDeleted = entityManager.createQuery(criteriaDelete).executeUpdate();
        return rowsDeleted > 0;
    }

    @Override
    public Optional<Order> findById(long orderId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(criteriaBuilder.equal(root.get(ID), orderId));
        List<Order> orderList = entityManager.createQuery(orderCriteria).getResultList();
        return (orderList.isEmpty())? Optional.empty(): Optional.ofNullable(orderList.get(0));
    }

    @Override
    public List<Order> findByCertificate(Certificate certificate) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(criteriaBuilder.equal(root.get(CERTIFICATE), certificate));
        return entityManager.createQuery(orderCriteria).getResultList();
    }

    private int getCountOfPages(long id) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery countQuery = criteriaBuilder.createQuery();
        Root<Order> root = countQuery.from(Order.class);
        countQuery.where(criteriaBuilder.equal(root.get(USER).get(ID), id));

        countQuery.select(criteriaBuilder.count(root));
        Long countResult = (Long) entityManager.createQuery(countQuery).getResultList().stream().findFirst().orElse(1L);
        return (int) ((countResult % pageSize == 0) ? (countResult / pageSize) : (countResult / pageSize) + 1);
    }
}
