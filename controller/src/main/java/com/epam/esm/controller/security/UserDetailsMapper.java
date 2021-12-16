package com.epam.esm.controller.security;

import com.epam.esm.dao.model.User;
import com.epam.esm.dao.model.UserRole;
import com.epam.esm.service.model.dto.UserDto;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import javax.management.relation.Role;
import java.util.ArrayList;
import java.util.List;

public class UserDetailsMapper {

    public static CustomUserDetails mapToUserDetails(UserDto user) {
        return new CustomUserDetails(
                user.getId(),
                user.getName(),
                user.getPassword(),
                mapToGrantedAuthorities(user.getRole())
        );
    }

    private static List<GrantedAuthority> mapToGrantedAuthorities(UserRole role) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(role.name()));
        return authorities;
    }

}