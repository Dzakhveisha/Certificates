package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.dao.model.User;

import java.util.List;
import java.util.Optional;

/**
 * DAO for User entity
 */
public interface UserDao {
    /**
     * Get page of all users from database
     *
     * @return page of all users from database
     */
    PageOfEntities<User> listOf(int pageNumber);

    /**
     * find user with such id
     *
     * @param id id of User
     * @return user
     */
    Optional<User> getById(Long id);

}
