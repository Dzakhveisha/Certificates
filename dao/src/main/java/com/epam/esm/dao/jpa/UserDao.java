package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Order;
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
    List<User> listOfAll(int pageNumber);

    Optional<User> getById(Long id);

}
