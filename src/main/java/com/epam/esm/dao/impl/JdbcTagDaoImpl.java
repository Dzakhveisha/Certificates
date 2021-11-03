package com.epam.esm.dao.impl;

import com.epam.esm.dao.BaseDao;
import com.epam.esm.model.Tag;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
import java.sql.SQLException;


@Component
public class JdbcTagDaoImpl extends BaseDao<Tag> {

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
    protected PreparedStatement prepareStatementForInsert(PreparedStatement preparedStatement, Tag entity) throws SQLException {
        preparedStatement.setString(1, entity.getName());
        return preparedStatement;
    }
}
