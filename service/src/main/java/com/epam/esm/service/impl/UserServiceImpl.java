package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.jpa.OrderDao;
import com.epam.esm.dao.jpa.impl.UserDaoImpl;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Order;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.UserService;
import com.epam.esm.service.exception.CertificateNotFoundException;
import com.epam.esm.service.exception.OrderNotBelongToUser;
import com.epam.esm.service.exception.OrderNotFoundException;
import com.epam.esm.service.exception.UserNotFoundException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDaoImpl userDao;
    private final OrderDao orderDao;
    private final CertificateDao certificateDao;
    private final Mapper<User, UserDto> userDtoMapper;
    private final Mapper<Order, OrderDto> orderDtoMapper;

    @Override
    public List<UserDto> findAll() {
        return userDao.listOfAll()
                .stream()
                .map(userDtoMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Transactional
    @Override
    public OrderDto createOrder(long userId, OrderDto order) {
        Certificate certificate = certificateDao.getEntityById(order.getCertificateId())
                .orElseThrow( () -> new CertificateNotFoundException(order.getCertificateId()));
        order.setPrice(certificate.getPrice());

        UserDto user = getById(userId);
        order.setUserId(user.getId());

        order.setDate(LocalDateTime.now());
        return orderDtoMapper.toDTO(
                orderDao.create(orderDtoMapper.toEntity(order))
        );
    }

    @Override
    public List<OrderDto> getUserOrders(long id) {
        return orderDao.getOrders(id)
                .stream()
                .map(orderDtoMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public UserDto getById(Long userId) {
        return userDtoMapper.toDTO(userDao
                .getById(userId)
                .orElseThrow(() -> new UserNotFoundException(userId))
        );
    }

    @Override
    public OrderDto getUserOrder(long userId, long orderId) {
        OrderDto order = orderDtoMapper.toDTO(orderDao.getById(orderId)
                .orElseThrow( () -> new OrderNotFoundException(orderId)));
        if (order.getUserId() == userId){
            return order;
        }
        else throw new OrderNotBelongToUser();
    }
}
