package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.jpa.OrderDao;
import com.epam.esm.dao.jpa.UserDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Order;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.OrderDtoMapper;
import com.epam.esm.service.mapper.UserDtoMapper;
import com.epam.esm.service.model.dto.CertificateDto;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.TagDto;
import com.epam.esm.service.model.dto.UserDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith({MockitoExtension.class})
class OrderServiceImplTest {
    private OrderServiceImpl orderService;

    @Mock
    private OrderDao orderDao;

    @Mock
    private UserDao userDao;

    @Mock
    private CertificateDao certificateDao;

    private static final String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
    private static final DateTimeFormatter formatterToLocalDateTime = DateTimeFormatter.ofPattern(DATE_TIME_PATTERN);


    private static final User[] USERS = {
            new User(1L, "User1"),
            new User(2L, "User2"),
            new User(3L, "User3")
    };

    private static final Certificate[] CERTIFICATES = {
            new Certificate(1L, "certificate1", "description1", 105L, 10,
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime),
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new Certificate(2L, "certificate2", "description2", 108L, 10,
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime),
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new Certificate(3L, "certificate3", "description3", 138L, 10,
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime),
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
    };

    private static final OrderDto[] ORDERS_DTO = {
            new OrderDto(1L, 2L, 2L, 100, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new OrderDto(1L, 1L, 2L, 100, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new OrderDto(1L, 2L, 3L, 100, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime))
    };

    private static final Order[] ORDERS = {
            new Order(1L, USERS[1], CERTIFICATES[1], 100, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new Order(1L, USERS[0], CERTIFICATES[1], 100, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new Order(1L, USERS[1], CERTIFICATES[2], 100, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime))
    };


    @BeforeEach
    void before() {
        orderService = new OrderServiceImpl(orderDao, certificateDao, userDao, new OrderDtoMapper());
    }


    @Test
    void createOrder() {
    }

    @Test
    void testGetUserOrdersShouldReturnOrderWithSuchId() {
        OrderDto orderDto = ORDERS_DTO[0];
        Order order = ORDERS[0];

        Mockito.when(orderDao.getById(1L)).thenReturn(Optional.of(order));

        assertEquals(orderService.getUserOrder(orderDto.getUserId(), orderDto.getId()), orderDto);
    }

    @Test
    void testGetUserOrdersShouldThrowEntityNotFoundExceptionIfOrderIsNotBelongToUser() {
        OrderDto orderDto = ORDERS_DTO[0];
        Order order = ORDERS[0];

        Mockito.when(orderDao.getById(1L)).thenReturn(Optional.of(order));

        assertThrows(EntityNotFoundException.class, () -> orderService.getUserOrder(3L, orderDto.getId()));
    }

    @Test
    void testGetUserOrdersShouldThrowEntityNotFoundExceptionIfOrderIsNotExist() {
        Mockito.when(orderDao.getById(222L)).thenReturn(Optional.empty());
        assertThrows(EntityNotFoundException.class, () -> orderService.getUserOrder(3L, 222L));
    }

    @Test
    void testGetUserOrdersShouldReturnAllOrdersIfDbIsNotEmpty() {
        List<OrderDto> ordersDto = Arrays.asList(ORDERS_DTO[0], ORDERS_DTO[2]);
        List<Order> orders = Arrays.asList(ORDERS[0], ORDERS[2]);

        Mockito.when(orderDao.listOf(2L, 1)).thenReturn(orders);
        List<OrderDto> actual = orderService.getUserOrders(2L,1);

        assertEquals(ordersDto, actual);
    }

    @Test
    void testGetUserOrdersShouldReturnEmptyListIfDbIsEmpty() {
        List<OrderDto> ordersDto = Collections.emptyList();
        List<Order> orders = Collections.emptyList();

        Mockito.when(orderDao.listOf(3L, 1)).thenReturn(orders);
        List<OrderDto> actual = orderService.getUserOrders(3L,1);

        assertEquals(ordersDto, actual);
    }
}