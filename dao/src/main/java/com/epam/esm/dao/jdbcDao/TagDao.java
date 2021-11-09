package com.epam.esm.dao.jdbcDao;

import com.epam.esm.dao.model.Tag;

import java.util.Optional;

public interface TagDao extends BaseDao<Tag>{
    Optional<Tag> getTagByName(String name);
}
