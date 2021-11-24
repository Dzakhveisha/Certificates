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

@Repository
@AllArgsConstructor
public class OrderDaoImpl implements OrderDao {
    @PersistenceContext
    private final EntityManager entityManager;

    @Override
    public List<Order> getOrders(long id) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(criteriaBuilder.equal(root.get("user").get("id"), id));
        return entityManager.createQuery(orderCriteria).getResultList();
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
}
