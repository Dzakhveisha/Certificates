package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.OrderDao;
import com.epam.esm.dao.model.Order;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;

import static com.epam.esm.dao.jpa.BaseDao.pageSize;

@Repository
@AllArgsConstructor
public class OrderDaoImpl implements OrderDao {
    @PersistenceContext
    private final EntityManager entityManager;

    @Override
    public List<Order> getOrders(long id, int pageNumber) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(criteriaBuilder.equal(root.get("user").get("id"), id));

        if (getLastPageNumber(id) < pageNumber){
            pageNumber = 1;
        }

        return entityManager.createQuery(orderCriteria)
                .setFirstResult((pageNumber - 1) * pageSize)
                .setMaxResults(pageSize)
                .getResultList();
    }

    @Override
    public Order create(Order order) {
        return entityManager.merge(order);
    }

    @Override
    public Optional<Order> getById(long orderId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(criteriaBuilder.equal(root.get("id"), orderId));
        List<Order> orderList = entityManager.createQuery(orderCriteria).getResultList();
        if (orderList.isEmpty()) {
            return Optional.empty();
        } else {
            return Optional.ofNullable(orderList.get(0));
        }
    }

    private int getLastPageNumber(long id) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery countQuery = criteriaBuilder.createQuery();
        Root<Order> root = countQuery.from(Order.class);
        countQuery.where(criteriaBuilder.equal(root.get("user").get("id"), id));

        countQuery.select(criteriaBuilder.count(root));

        Long countResult = (long) entityManager.createQuery(countQuery).getSingleResult();

        return (int) ((countResult / pageSize) + 1);
    }
}
