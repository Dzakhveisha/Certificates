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
    private final EntityManager em;

    @Override
    public List<Order> getOrders(long id) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = cb.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(cb.equal(root.get("user").get("id"), id));
        return em.createQuery(orderCriteria).getResultList();
    }

    @Override
    public Order create(Order order) {
        return em.merge(order);
    }

    @Override
    public Optional<Order> getById(long orderId) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Order> orderCriteria = cb.createQuery(Order.class);
        Root<Order> root = orderCriteria.from(Order.class);

        orderCriteria.where(cb.equal(root.get("id"), orderId));
        List<Order> orderList = em.createQuery(orderCriteria).getResultList();
        if (orderList.isEmpty()){
            return  Optional.empty();
        }
        else {
            return Optional.ofNullable(orderList.get(0));
        }
    }
}
