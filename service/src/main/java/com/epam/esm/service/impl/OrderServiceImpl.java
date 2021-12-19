package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateRepository;
import com.epam.esm.dao.jpa.OrderRepository;
import com.epam.esm.dao.jpa.UserRepository;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Order;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.OrderService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.time.LocalDateTime;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final CertificateRepository certificateRepository;
    private final UserRepository userRepository;
    private final Mapper<Order, OrderDto> orderDtoMapper;

    @Transactional
    @Override
    public OrderDto create(long userId, OrderDto order) {
        order.setDate(LocalDateTime.now());

        Certificate certificate = certificateRepository.findById(order.getCertificateId())
                .orElseThrow(() -> new EntityNotFoundException("Certificate", order.getCertificateId()));
        order.setPrice(certificate.getPrice());
        User user = userRepository.findById(userId).orElseThrow(() -> new EntityNotFoundException("User", userId));

        Order orderEntity = orderDtoMapper.toEntity(order);
        orderEntity.setUser(user);
        orderEntity.setCertificate(certificate);

        return orderDtoMapper.toDTO(orderRepository.save(orderEntity));
    }

    @Override
    public Page<OrderDto> findUserOrders(UserDto user, int pageNumber) {
        Page<Order> orderPage = orderRepository.findByUserId(user.getId(), PageRequest.of(pageNumber - 1, 10));
        return orderPage.map(orderDtoMapper::toDTO);
    }

    @Override
    public OrderDto findUserOrder(long userId, long orderId) {
        OrderDto order = orderRepository.findById(orderId)
                .map(orderDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Order", orderId));
        if (order.getUserId().equals(userId)) {
            return order;
        } else {
            throw new EntityNotFoundException("Order", orderId);
        }
    }
}
