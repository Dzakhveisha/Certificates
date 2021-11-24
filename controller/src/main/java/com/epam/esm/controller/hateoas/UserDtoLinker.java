package com.epam.esm.controller.hateoas;

import com.epam.esm.controller.web.UserController;
import com.epam.esm.service.model.dto.UserDto;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Component
public class UserDtoLinker implements Linker<UserDto> {
    @Override
    public void addLinks(UserDto user) {
        user.add(linkTo(methodOn(UserController.class)
                .getUser(user.getId()))
                .withSelfRel());

        user.add(linkTo(methodOn(UserController.class)
                .getUserOrders(user.getId()))
                .withRel("orders"));
    }
}
