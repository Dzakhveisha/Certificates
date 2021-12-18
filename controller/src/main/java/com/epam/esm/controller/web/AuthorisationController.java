package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.controller.security.SecurityService;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@Validated
public class AuthorisationController {

    private final UserService userService;
    private final SecurityService securityService;
    private final Linker<UserDto> userDtoLinker;


    @PreAuthorize("permitAll()")
    @PostMapping("/registration")
    public UserDto registerUser(@RequestBody @Valid UserDto user) {
        UserDto registerUser = userService.register(user);
        userDtoLinker.addLinks(registerUser);
        return registerUser;
    }
}
