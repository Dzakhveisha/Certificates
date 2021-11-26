package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Order;

import java.util.List;
import java.util.Optional;

public interface OrderDao {
    List<Order> getOrders(long id, int pageNumber);

    Order create(Order order);

    Optional<Order> getById(long orderId);
}
