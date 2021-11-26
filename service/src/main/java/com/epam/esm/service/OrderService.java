package com.epam.esm.service;

import com.epam.esm.service.model.dto.OrderDto;

import java.util.List;

public interface OrderService {
    OrderDto createOrder(long userId, OrderDto order);

    List<OrderDto> getUserOrders(long id, int pageNumber);

    OrderDto getUserOrder(long userId, long orderId);
}
