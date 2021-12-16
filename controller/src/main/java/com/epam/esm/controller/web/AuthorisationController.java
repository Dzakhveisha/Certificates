package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.controller.security.SecurityService;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1")
@Validated
public class AuthorisationController {

    private UserService userService;
    private SecurityService securityService;
    private Linker<UserDto> userDtoLinker;

    @PostMapping("login")
    public UserDto login(@RequestBody UserDto user) {

        // todo: ???

        return user;
    }

    @PostMapping("registration")
    public UserDto registerUser(@RequestBody UserDto user) {

        userService.add(user); //register
        userDtoLinker.addLinks(user);
        return user;
    }
}
