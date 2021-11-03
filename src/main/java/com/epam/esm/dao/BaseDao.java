package com.epam.esm.dao;

import com.epam.esm.model.BaseEntity;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@AllArgsConstructor
public abstract class BaseDao<T extends BaseEntity> {

    private static final String SQL_INSERT = "INSERT INTO ";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM %s WHERE id = ?";
    protected static final String SQL_SELECT = "SELECT * FROM ";
    private static final String SQL_DELETE = "DELETE FROM %s WHERE id = ?";

    protected final JdbcTemplate jdbcTemplate;
    protected final RowMapper<T> rowMapper;

    protected abstract String getTableName();

    protected abstract String getFieldsForCreating();

    protected abstract PreparedStatement prepareStatementForInsert(PreparedStatement ps, T entity) throws SQLException;

    public T createEntity(T entity) {
        String SQL = SQL_INSERT + getTableName() + getFieldsForCreating();

        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(SQL, new String[]{"id"});
            return prepareStatementForInsert(ps, entity);
        }, keyHolder);

        return getEntityById(Objects.requireNonNull(keyHolder.getKey()).longValue()).get();
    }

    public Optional<T> getEntityById(Long id) {
        String SQL = String.format(SQL_SELECT_BY_ID, getTableName());
        List<T> certificate = jdbcTemplate.query(SQL, rowMapper, id);
        if (certificate.size() == 0) {
            return Optional.empty();
        } else {
            return Optional.of(certificate.get(0));
        }
    }

    public List<T> listOfEntities() {
        String SQL = SQL_SELECT + getTableName();
        return jdbcTemplate.query(SQL, rowMapper);
    }


    public boolean removeEntity(Long id) {
        String SQL = String.format(SQL_DELETE, getTableName());
        return jdbcTemplate.update(SQL, id) == 1;

    }
}
