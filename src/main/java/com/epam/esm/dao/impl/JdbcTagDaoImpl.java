package com.epam.esm.dao.impl;

import com.epam.esm.dao.BaseDaoImpl;
import com.epam.esm.model.Tag;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;


@Component
public class JdbcTagDaoImpl extends BaseDaoImpl<Tag> {

    private static final String TAG_ID = "id";
    private static final String TAG_NAME = "name";

    public JdbcTagDaoImpl(JdbcTemplate jdbcTemplate, RowMapper<Tag> rowMapper) {
        super(jdbcTemplate, rowMapper);
    }

    @Override
    protected String getTableName() {
        return "tags";
    }

    @Override
    protected String getFieldsForCreating() {
        return String.format(" (%s) values (?) ", TAG_NAME);

    }

    @Override
    protected Object[] getValuesForCreating(Tag entity) {
        return new Object[]{entity.getName()};
    }
}
