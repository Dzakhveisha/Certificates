package com.epam.esm.service;

import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;

import java.util.List;

public interface UserService {
    /**
     * Find all users
     *
     * @return list of users
     */
    List<UserDto> findAll();

    OrderDto createOrder(long userId, OrderDto order);

    List<OrderDto> getUserOrders(long id);

    UserDto getById(Long userId);

    OrderDto getUserOrder(long userId, long orderId);
}
