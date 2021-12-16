package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.User;

import java.nio.channels.FileChannel;
import java.util.Optional;

/**
 * DAO for User entity
 */
public interface UserDao extends BaseDao<User> {

    Optional<User> findByName(String username);
}
