package com.epam.esm.dao.jdbcDao;

import com.epam.esm.dao.model.Tag;

import java.util.Optional;

/**
 * DAO for Tag entity
 */
public interface TagDao extends BaseDao<Tag>{
    /**
     * Get entity by it's name from database
     *
     * @param name name of needed tag
     * @return found tag with such name
     */
    Optional<Tag> getTagByName(String name);
}
