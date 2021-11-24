package com.epam.esm.service;

import com.epam.esm.service.model.dto.UserDto;

import java.util.List;

public interface UserService {
    /**
     * Find all users
     *
     * @return list of users
     */
    List<UserDto> findAll();

    /**
     * Find user by id
     *
     * @param userId id of user
     * @return user
     */
    UserDto getById(Long userId);
}
