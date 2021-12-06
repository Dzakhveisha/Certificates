package com.epam.esm.service;

import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.model.dto.UserDto;

public interface UserService {
    /**
     * Find page of all users
     *
     * @return page of users
     */
    PageOfEntities<UserDto> findAll(int pageNumber);

    /**
     * Find user by id
     *
     * @param userId id of user
     * @return user
     */
    UserDto findById(Long userId);
}
