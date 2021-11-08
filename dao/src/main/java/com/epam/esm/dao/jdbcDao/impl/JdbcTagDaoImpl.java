package com.epam.esm.dao.jdbcDao.impl;

import com.epam.esm.dao.jdbcDao.BaseDao;
import com.epam.esm.dao.model.Tag;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;


@Component
public class JdbcTagDaoImpl extends BaseDao<Tag> {

    private static final String TAG_NAME = "name";

    private static final String SQL_SELECT_BY_NAME = "SELECT * FROM %s WHERE name = ?";


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

    public Optional<Tag> getTagByName(String name) {
        String SQL = String.format(SQL_SELECT_BY_NAME, getTableName());
        List<Tag> certificate = jdbcTemplate.query(SQL, rowMapper, name);
        if (certificate.size() == 0) {
            return Optional.empty();
        } else {
            return Optional.of(certificate.get(0));
        }
    }
}
