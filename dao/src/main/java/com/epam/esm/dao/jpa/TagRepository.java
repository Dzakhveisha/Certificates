package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * DAO for Tag entity
 */
public interface TagRepository extends JpaRepository<Tag, Long> {
    /**
     * Get entity by it's name from database
     *
     * @param name name of needed tag
     * @return found tag with such name
     */
    Optional<Tag> findByName(String name);
}
