package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.UserService;
import com.epam.esm.service.model.dto.OrderDto;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.Min;

@RequiredArgsConstructor
@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;
    private final Linker<UserDto> userDtoLinker;

    @GetMapping
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public PageOfEntities<UserDto> getUsers(@Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {
        Page<UserDto> usersPage = userService.findAll(pageNumber);
        usersPage.forEach(userDtoLinker::addLinks);
        PageOfEntities<UserDto> page = new PageOfEntities<>(usersPage.getTotalPages(),
                usersPage.getPageable().getPageNumber() + 1, usersPage.getContent());
        userDtoLinker.addPaginationLinks(page);
        return page;
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public UserDto getUser(@PathVariable long id) {
        UserDto user = userService.findById(id);
        userDtoLinker.addLinks(user);
        return user;
    }
}
