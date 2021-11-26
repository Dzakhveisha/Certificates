package com.epam.esm.controller.hateoas;

import com.epam.esm.controller.web.CertificateController;
import com.epam.esm.controller.web.UserController;
import com.epam.esm.service.model.dto.OrderDto;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Component
public class OrderDtoLinker implements Linker<OrderDto> {
    @Override
    public void addLinks(OrderDto order) {
        order.add(linkTo((methodOn(UserController.class)
                .getUserOrderById(order.getUserId(), order.getId())))
                .withSelfRel());

        order.add(linkTo(methodOn(UserController.class)
                .getUser(order.getUserId()))
                .withRel("user"));

        order.add(linkTo(methodOn(CertificateController.class)
                .getCertificate(order.getCertificateId()))
                .withRel("certificate"));
    }
}
