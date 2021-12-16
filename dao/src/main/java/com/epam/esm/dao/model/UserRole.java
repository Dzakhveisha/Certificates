package com.epam.esm.dao.model;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;

import java.util.Arrays;
import java.util.Optional;

public enum UserRole{
    USER(1L),
    ADMIN(2L);

    @Getter
    private final Long roleNumber;

    UserRole(long roleId) {
        this.roleNumber = roleId;
    }

    public static UserRole getRoleByLong(long roleNumber) {
        Optional<UserRole> foundRole = Arrays.stream(UserRole.values())
                .filter((role) -> role.roleNumber.equals(roleNumber))
                .findFirst();
        return foundRole.orElse(USER);
    }
}
