package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * DAO for User entity
 */
public interface UserRepository extends JpaRepository<User, Long> {

    /**
     * Find user by his name
     *
     * @param username name
     * @return user
     */
    Optional<User> findByName(String username);
}
