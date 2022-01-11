package com.epam.esm.controller.hateoas;

import com.epam.esm.controller.web.CertificateController;
import com.epam.esm.controller.web.OrderController;
import com.epam.esm.controller.web.UserController;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.model.dto.OrderDto;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Component
public class OrderDtoLinker implements Linker<OrderDto> {
    @Override
    public void addLinks(OrderDto order) {
        order.add(linkTo((methodOn(OrderController.class)
                .getUserOrderById(order.getUserId(), order.getId())))
                .withSelfRel());

        order.add(linkTo(methodOn(UserController.class)
                .getUser(order.getUserId()))
                .withRel("user"));

        order.add(linkTo(methodOn(CertificateController.class)
                .getCertificate(order.getCertificateId()))
                .withRel("certificate"));
    }

    @Override
    public void addPaginationLinks(PageOfEntities<OrderDto> page) {
        if (page.getPageNumber() > 1) {
            page.add(linkTo(methodOn(OrderController.class)
                    .getUserOrders(page.getPage().get(0).getUserId(), page.getPageNumber() - 1))
                    .withRel("PrevPage"));
        }
        if (page.getPageNumber() < page.getCountOfPages()) {
            page.add(linkTo(methodOn(OrderController.class)
                    .getUserOrders(page.getPage().get(0).getUserId(), page.getPageNumber() + 1))
                    .withRel("NextPage"));
        }
    }
}
