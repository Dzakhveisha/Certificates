package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.jpa.OrderDao;
import com.epam.esm.dao.jpa.UserDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Order;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.OrderService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.OrderDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderDao orderDao;
    private final CertificateDao certificateDao;
    private final UserDao userDao;
    private final Mapper<Order, OrderDto> orderDtoMapper;


    @Transactional
    @Override
    public OrderDto createOrder(long userId, OrderDto order) {
        order.setDate(LocalDateTime.now());

        Certificate certificate = certificateDao.getById(order.getCertificateId())
                .orElseThrow(() -> new EntityNotFoundException("Certificate", order.getCertificateId()));
        order.setPrice(certificate.getPrice());
        User user = userDao.getById(userId).orElseThrow(() -> new EntityNotFoundException("User", userId));

        Order orderEntity = orderDtoMapper.toEntity(order);
        orderEntity.setUser(user);
        orderEntity.setCertificate(certificate);

        return orderDtoMapper.toDTO(orderDao.create(orderEntity));
    }

    @Override
    public List<OrderDto> getUserOrders(long id, int pageNumber) {
        return orderDao.listOf(id, pageNumber)
                .stream()
                .map(orderDtoMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public OrderDto getUserOrder(long userId, long orderId) {
        OrderDto order = orderDao.getById(orderId)
                .map(orderDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Order", orderId));
        if (order.getUserId().equals(userId)) {
            return order;
        } else {
            throw new EntityNotFoundException("Order", orderId);
        }
    }
}
