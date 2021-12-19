package com.epam.esm.service;

import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;
import org.springframework.data.domain.Page;

public interface OrderService {
    /**
     * create new order for user
     *
     * @param userId id of user
     * @param order  order to create
     * @return created order
     */
    OrderDto create(long userId, OrderDto order);

    /**
     * Find orders, which belongs to this user
     *
     *
     * @param user
     * @param pageNumber number of page
     * @return page of orders
     */
    Page<OrderDto> findUserOrders(UserDto user, int pageNumber);

    /**
     * return order with such id? and which belongs to this user
     *
     * @param userId  id of user
     * @param orderId id of order
     * @return order
     */
    OrderDto findUserOrder(long userId, long orderId);
}
