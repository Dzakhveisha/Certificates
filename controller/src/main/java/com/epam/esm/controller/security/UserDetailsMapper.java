package com.epam.esm.controller.security;

import com.epam.esm.service.model.dto.UserDto;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class UserDetailsMapper {

    public static CustomUserDetails mapToUserDetails(UserDto user) {
        return new CustomUserDetails(
                user.getId(),
                user.getName(),
                user.getPassword(),
                new SimpleGrantedAuthority(user.getRole().name())
        );
    }
}