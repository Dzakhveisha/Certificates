package com.epam.esm.dao.jdbcDao;

import com.epam.esm.dao.model.BaseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

/**
 * Generic DAO, containing base operations with database
 *
 * @param <T> entities which DAO operates with
 */
public interface BaseDao<T extends BaseEntity> {

    String SQL_INSERT = "INSERT INTO ";
    String SQL_SELECT_BY_ID = "SELECT * FROM %s WHERE id = ?";
    String SQL_SELECT = "SELECT * FROM ";
    String SQL_DELETE = "DELETE FROM %s WHERE id = ?";

    /**
     * @return name of table in database
     */
    String getTableName();

    /**
     * @return string containing all fields names
     */
    String getFieldsForCreating();

    /**
     * @return JdbcTemplate object
     */
    JdbcTemplate getJdbcTemplate();

    /**
     * @return RowMapper object for entity T
     */
    RowMapper<T> getRowMapper();

    /**
     * Build prepared statement for insert query
     *
     * @param preparedStatement prepared statement
     * @param entity inserted entity
     * @return prepared Statement
     * @throws SQLException
     */
    PreparedStatement prepareStatementForInsert(PreparedStatement preparedStatement, T entity) throws SQLException;

    /**
     * Create new entity in database
     *
     * @param entity entity for creating
     * @return created entity from database
     */
    default T createEntity(T entity) {
        String SQL = SQL_INSERT + getTableName() + getFieldsForCreating();

        KeyHolder keyHolder = new GeneratedKeyHolder();
        getJdbcTemplate().update(connection -> {
            PreparedStatement ps = connection.prepareStatement(SQL, new String[]{"id"});
            return prepareStatementForInsert(ps, entity);
        }, keyHolder);

        return getEntityById(Objects.requireNonNull(keyHolder.getKey()).longValue()).get();
    }

    /**
     * Get entity by it's id from database
     *
     * @param id id of needed entity
     * @return needed entity
     */
    default Optional<T> getEntityById(Long id) {
        String SQL = String.format(SQL_SELECT_BY_ID, getTableName());
        List<T> certificate = getJdbcTemplate().query(SQL, getRowMapper(), id);
        if (certificate.size() == 0) {
            return Optional.empty();
        } else {
            return Optional.of(certificate.get(0));
        }
    }

    /**
     * Get all entities from database
     *
     * @return list of all entities from database
     */
    default List<T> listOfEntities() {
        String SQL = SQL_SELECT + getTableName();
        return getJdbcTemplate().query(SQL, getRowMapper());
    }


    /**
     * Remove entity with such id in database
     *
     * @param id id of entity to be deleted
     * @return true, if  successful deletion, else false
     */
    default boolean removeEntity(Long id) {
        String SQL = String.format(SQL_DELETE, getTableName());
        return getJdbcTemplate().update(SQL, id) == 1;
    }
}
