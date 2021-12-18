package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@Validated
@Slf4j
public class AuthorisationController {

    private final UserService userService;
    private final Linker<UserDto> userDtoLinker;

    @PreAuthorize("permitAll()")
    @PostMapping("/registration")
    public UserDto registerUser(@RequestBody @Valid UserDto user) {
        UserDto registerUser = userService.register(user);
        userDtoLinker.addLinks(registerUser);
        return registerUser;
    }
}
