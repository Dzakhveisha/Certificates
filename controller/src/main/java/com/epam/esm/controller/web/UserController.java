package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/users")
public class UserController {

    private final UserService userService;

    @GetMapping
    public List<UserDto> getUsers() {
        List<UserDto> users = userService.findAll();
        users.forEach(Linker::addLinks);
        return users;
    }

    @GetMapping("/{id}")
    public UserDto getUser(@PathVariable long id) {
        UserDto user = userService.getById(id);
        Linker.addLinks(user);
        return user;
    }

    @PostMapping("/{id}/orders")
    @ResponseStatus(HttpStatus.CREATED)
    public OrderDto createOrder(@PathVariable long id, @Valid @RequestBody OrderDto order) {
        OrderDto createdOrder = userService.createOrder(id, order);
        Linker.addLinks(createdOrder);
        return createdOrder;
    }

    @GetMapping("/{id}/orders")
    public List<OrderDto> getUserOrders(@PathVariable long id) {  // получить данные о заказах пользователя
        List<OrderDto> userOrders = userService.getUserOrders(id);
        userOrders.forEach(Linker::addLinks);
        return userOrders;
    }

    @GetMapping("/{id}/orders/{orderId}")
    public OrderDto getUserOrderById(@PathVariable long id, @PathVariable long orderId) {
        OrderDto userOrder = userService.getUserOrder(id, orderId);
        Linker.addLinks(userOrder);
        return userOrder;
    }
}
