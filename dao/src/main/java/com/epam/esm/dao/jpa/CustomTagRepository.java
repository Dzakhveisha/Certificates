package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Tag;

import java.util.Optional;

public interface CustomTagRepository {
    /**
     * Find the most widely used tag in database of a user with the highest cost of all orders
     *
     * @return most useful tag
     */
    Optional<Tag> findMostUsefulByMostActiveUser();
}
