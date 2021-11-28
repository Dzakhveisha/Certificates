package com.epam.esm.dao.mapper;

import com.epam.esm.dao.model.Tag;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class TagRowMapper implements RowMapper<Tag> {

    private static final String TAG_ID = "id";
    private static final String TAG_NAME = "name";

    @Override
    public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
        Tag tag = new Tag();
        tag.setId(rs.getLong(TAG_ID));
        tag.setName(rs.getString(TAG_NAME));
        return tag;
    }
}
