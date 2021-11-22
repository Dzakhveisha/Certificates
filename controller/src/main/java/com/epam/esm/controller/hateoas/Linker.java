package com.epam.esm.controller.hateoas;

import com.epam.esm.controller.web.CertificateController;
import com.epam.esm.controller.web.TagController;
import com.epam.esm.controller.web.UserController;
import com.epam.esm.service.model.dto.CertificateDto;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.TagDto;
import com.epam.esm.service.model.dto.UserDto;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

public class Linker {
    static public void addLinks(TagDto tag){
        tag.add(linkTo(methodOn(TagController.class)
                .getTag(tag.getId()))
                .withSelfRel());
    }

    static public void addLinks(CertificateDto certificate){
        certificate.add(linkTo(CertificateController.class)
                .slash(certificate.getId())
                .withSelfRel());

        certificate.getTags()
                .forEach((tagDto -> certificate.add(linkTo(methodOn(TagController.class)
                        .getTag(tagDto.getId()))
                        .withRel("tags"))));

//        certificate.add(linkTo(methodOn(CertificateController.class)
//                .updateCertificate(certificate.getId(), certificate))
//                .withRel("PATCH"));
//        certificate.add(linkTo(CertificateController.class)
//                .slash(certificate.getId())
//                .withRel("DELETE"));
    }
    static public void addLinks(OrderDto order){
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
    static public void addLinks(UserDto user){
        user.add(linkTo(methodOn(UserController.class)
                .getUser(user.getId()))
                .withSelfRel());

        user.add(linkTo(methodOn(UserController.class)
                .getUserOrders(user.getId()))
                .withRel("orders"));
    }
}
