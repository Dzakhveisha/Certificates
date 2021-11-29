package com.epam.esm.service;

import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.model.dto.OrderDto;

public interface OrderService {
    /**
     * create new order for user
     *
     * @param userId id of user
     * @param order  order to create
     * @return created order
     */
    OrderDto createOrder(long userId, OrderDto order);

    /**
     * Find orders, which belongs to this user
     *
     * @param id         id of user
     * @param pageNumber number of page
     * @return page of orders
     */
    PageOfEntities<OrderDto> getUserOrders(long id, int pageNumber);

    /**
     * return order with such id? and which belongs to this user
     *
     * @param userId  id of user
     * @param orderId id of order
     * @return order
     */
    OrderDto getUserOrder(long userId, long orderId);
}
