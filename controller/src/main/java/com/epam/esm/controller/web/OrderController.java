package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.OrderService;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.OrderDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
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
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/users")
public class OrderController {
    private final OrderService orderService;
    private final UserService userService;
    private final Linker<OrderDto> orderDtoLinker;

    @PostMapping("/{id}/orders")
    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("hasAuthority('ADMIN') OR (hasAuthority('USER') AND #id == principal.id)")
    public OrderDto createOrder(@PathVariable long id, @Valid @RequestBody OrderDto order) {
        OrderDto createdOrder = orderService.create(id, order);
        orderDtoLinker.addLinks(createdOrder);
        return createdOrder;
    }

    @GetMapping("/{id}/orders")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public PageOfEntities<OrderDto> getUserOrders(@PathVariable long id,
                                                  @Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {
        Page<OrderDto> userOrdersPage = orderService.findUserOrders(userService.findById(id), pageNumber);
        userOrdersPage.forEach(orderDtoLinker::addLinks);
        PageOfEntities<OrderDto> page = new PageOfEntities<>(userOrdersPage.getTotalPages(),
                userOrdersPage.getPageable().getPageNumber() + 1, userOrdersPage.getContent());
        orderDtoLinker.addPaginationLinks(page);
        return page;
    }

    @GetMapping("/{id}/orders/{orderId}")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public OrderDto getUserOrderById(@PathVariable long id, @PathVariable long orderId) {
        OrderDto userOrder = orderService.findUserOrder(id, orderId);
        orderDtoLinker.addLinks(userOrder);
        return userOrder;
    }
}
