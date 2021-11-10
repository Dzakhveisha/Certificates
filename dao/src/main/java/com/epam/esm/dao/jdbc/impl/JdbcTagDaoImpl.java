package com.epam.esm.dao.jdbc.impl;

import com.epam.esm.dao.jdbc.TagDao;
import com.epam.esm.dao.model.Tag;
import lombok.Data;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;


@Component
@Data
public class JdbcTagDaoImpl implements TagDao {

    private static final String TAG_NAME = "name";

    private static final String SQL_SELECT_BY_NAME = "SELECT * FROM %s WHERE name = ?";

    private final JdbcTemplate jdbcTemplate;
    private final RowMapper<Tag> rowMapper;

    public JdbcTagDaoImpl(JdbcTemplate jdbcTemplate, RowMapper<Tag> rowMapper) {
        this.jdbcTemplate = jdbcTemplate;
        this.rowMapper = rowMapper;
    }

    @Override
    public String getTableName() {
        return "tags";
    }

    @Override
    public String getFieldsForCreating() {
        return String.format(" (%s) values (?) ", TAG_NAME);
    }

    @Override
    public PreparedStatement prepareStatementForInsert(PreparedStatement preparedStatement, Tag entity) throws SQLException {
        preparedStatement.setString(1, entity.getName());
        return preparedStatement;
    }

    @Override
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
