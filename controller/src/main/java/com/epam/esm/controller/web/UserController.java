package com.epam.esm.controller.web;

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
    List<UserDto> getUsers() {
        return userService.findAll();
    }

    @GetMapping("/{id}")
    UserDto getUser(@PathVariable long id) {
        return userService.getById(id);
    }

    @PostMapping("/{id}/orders")
    @ResponseStatus(HttpStatus.CREATED)
    OrderDto createOrder(@PathVariable long id, @Valid @RequestBody OrderDto order) {
        return userService.createOrder(id, order);
    }

    @GetMapping("/{id}/orders")
    List<OrderDto> getUserOrders(@PathVariable long id) {  // получить данные о заказах пользователя
        return userService.getUserOrders(id);
    }

    @GetMapping("/{id}/orders/{orderId}")
    OrderDto getUserOrderById(@PathVariable long id, @PathVariable long orderId) {
        return userService.getUserOrder(id, orderId);
    }
}
