package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.OrderService;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.constraints.Min;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/users")
public class UserController {

    private final UserService userService;
    private final OrderService orderService;
    private final Linker<UserDto> userDtoLinker;
    private final Linker<OrderDto> orderDtoLinker;

    @GetMapping
    public PageOfEntities<UserDto> getUsers(@Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {
        PageOfEntities<UserDto> usersPage = userService.findAll(pageNumber);
        usersPage.getCurPage().forEach(userDtoLinker::addLinks);
        userDtoLinker.addPaginationLinks(usersPage);
        return usersPage;
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
    public PageOfEntities<OrderDto> getUserOrders(@PathVariable long id,
                                                  @Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {
        PageOfEntities<OrderDto> userOrdersPage = orderService.getUserOrders(id, pageNumber);
        userOrdersPage.getCurPage().forEach(orderDtoLinker::addLinks);
        orderDtoLinker.addPaginationLinks(userOrdersPage);
        return userOrdersPage;
    }

    @GetMapping("/{id}/orders/{orderId}")
    public OrderDto getUserOrderById(@PathVariable long id, @PathVariable long orderId) {
        OrderDto userOrder = orderService.getUserOrder(id, orderId);
        orderDtoLinker.addLinks(userOrder);
        return userOrder;
    }
}
