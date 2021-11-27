package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.User;

import java.util.List;
import java.util.Optional;

/**
 * DAO for User entity
 */
public interface UserDao {
    /**
     * Get all users from database
     *
     * @return list of all users from database
     */
    List<User> listOf(int pageNumber);

    /**
     * find user with such id
     *
     * @param id id of User
     * @return user
     */
    Optional<User> getById(Long id);

}
