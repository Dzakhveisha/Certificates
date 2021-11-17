package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.User;

import java.util.List;

/**
 * DAO for User entity
 */
public interface UserDao {
    /**
     * Get all users from database
     *
     * @return list of all users from database
     */
    List<User> listOfAll();
}
