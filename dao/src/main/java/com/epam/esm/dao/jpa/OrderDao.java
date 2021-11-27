package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Order;

import java.util.List;
import java.util.Optional;

/**
 * DAO for Order entity
 */
public interface OrderDao {
    /**
     * find all orders of user
     *
     * @param id         id of user
     * @param pageNumber number of page
     * @return orders
     */
    List<Order> listOf(long id, int pageNumber);

    /**
     * create new order
     *
     * @param order to be create
     * @return created order
     */
    Order create(Order order);

    /**
     * find order with such id
     *
     * @param orderId id of order
     * @return order
     */
    Optional<Order> getById(long orderId);
}
