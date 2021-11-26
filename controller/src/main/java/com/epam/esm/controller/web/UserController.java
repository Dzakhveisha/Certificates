package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.service.OrderService;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/users")
public class UserController {

    private final UserService userService;
    private final OrderService orderService;
    private final Linker<UserDto> userDtoLinker;
    private final Linker<OrderDto> orderDtoLinker;

    @GetMapping
    public List<UserDto> getUsers(@Min(1) @RequestParam(required = false, defaultValue = "1" ) int pageNumber) {
        List<UserDto> users = userService.findAll(pageNumber);
        users.forEach(userDtoLinker::addLinks);
        return users;
    }

    @GetMapping("/{id}")
    public UserDto getUser(@PathVariable long id) {
        UserDto user = userService.getById(id);
        userDtoLinker.addLinks(user);
        return user;
    }

    @PostMapping("/{id}/orders")
    @ResponseStatus(HttpStatus.CREATED)
    public OrderDto createOrder(@PathVariable long id, @Valid @RequestBody OrderDto order) {
        OrderDto createdOrder = orderService.createOrder(id, order);
        orderDtoLinker.addLinks(createdOrder);
        return createdOrder;
    }

    @GetMapping("/{id}/orders")
    public List<OrderDto> getUserOrders(@PathVariable long id,
                                        @Min(1) @RequestParam(required = false, defaultValue = "1" ) int pageNumber) {
        List<OrderDto> userOrders = orderService.getUserOrders(id, pageNumber);
        userOrders.forEach(orderDtoLinker::addLinks);
        return userOrders;
    }

    @GetMapping("/{id}/orders/{orderId}")
    public OrderDto getUserOrderById(@PathVariable long id, @PathVariable long orderId) {
        OrderDto userOrder = orderService.getUserOrder(id, orderId);
        orderDtoLinker.addLinks(userOrder);
        return userOrder;
    }
}
