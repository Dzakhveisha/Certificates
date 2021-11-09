package com.epam.esm.dao.jdbcDao;

import com.epam.esm.dao.model.BaseEntity;
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

public interface BaseDao<T extends BaseEntity> {

     String SQL_INSERT = "INSERT INTO ";
     String SQL_SELECT_BY_ID = "SELECT * FROM %s WHERE id = ?";
     String SQL_SELECT = "SELECT * FROM ";
     String SQL_DELETE = "DELETE FROM %s WHERE id = ?";

     String getTableName();

     String getFieldsForCreating();

     JdbcTemplate getJdbcTemplate();

     RowMapper<T> getRowMapper();

     PreparedStatement prepareStatementForInsert(PreparedStatement ps, T entity) throws SQLException;

    default T createEntity(T entity) {
        String SQL = SQL_INSERT + getTableName() + getFieldsForCreating();

        KeyHolder keyHolder = new GeneratedKeyHolder();
        getJdbcTemplate().update(connection -> {
            PreparedStatement ps = connection.prepareStatement(SQL, new String[]{"id"});
            return prepareStatementForInsert(ps, entity);
        }, keyHolder);

        return getEntityById(Objects.requireNonNull(keyHolder.getKey()).longValue()).get();
    }

    default Optional<T> getEntityById(Long id) {
        String SQL = String.format(SQL_SELECT_BY_ID, getTableName());
        List<T> certificate = getJdbcTemplate().query(SQL, getRowMapper(), id);
        if (certificate.size() == 0) {
            return Optional.empty();
        } else {
            return Optional.of(certificate.get(0));
        }
    }

    default List<T> listOfEntities() {
        String SQL = SQL_SELECT + getTableName();
        return getJdbcTemplate().query(SQL, getRowMapper());
    }


    default boolean removeEntity(Long id) {
        String SQL = String.format(SQL_DELETE, getTableName());
        return getJdbcTemplate().update(SQL, id) == 1;
    }
}
