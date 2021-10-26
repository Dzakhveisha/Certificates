package com.epam.esm.dao;

import com.epam.esm.model.BaseEntity;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@AllArgsConstructor
public abstract class BaseDaoImpl<T extends BaseEntity> implements BaseDao<T> {

    protected final JdbcTemplate jdbcTemplate;
    protected final RowMapper<T> rowMapper;

    protected abstract String getTableName();
    protected abstract String getFieldsForCreating();
    protected abstract Object[] getValuesForCreating(T entity);

    @Override
    public void createEntity(T entity) {
        String SQL = "INSERT INTO " + getTableName() + getFieldsForCreating();
        jdbcTemplate.update( SQL, getValuesForCreating(entity) );
    }

    /*String sql = "INSERT INTO CUSTOMER " +
            "(CUST_ID, NAME, AGE) VALUES (?, ?, ?)";

    getJdbcTemplate().batchUpdate(sql, new BatchPreparedStatementSetter() {

        @Override
        public void setValues(PreparedStatement ps, int i) throws SQLException {
            Customer customer = customers.get(i);
            ps.setLong(1, customer.getCustId());
            ps.setString(2, customer.getName());
            ps.setInt(3, customer.getAge() );
        }

        @Override
        public int getBatchSize() {
            return customers.size();
        }
    });*/

    @Override
    public Optional<T> getEntityById(Long id) {
        String SQL = "SELECT * FROM " + getTableName() + " WHERE id = ?";
        List<T> certificate = jdbcTemplate.query(SQL, rowMapper, id);
        if (certificate.size() == 0) {
            return Optional.empty();
        } else {
            return Optional.of(certificate.get(0));
        }
    }

    @Override
    public List<T> listOfEntities() {
        String SQL = "SELECT * FROM " + getTableName();
        return jdbcTemplate.query(SQL, rowMapper);
    }

    @Override
    public boolean removeEntity(Long id) {
        String SQL = "DELETE FROM " + getTableName() + " WHERE id = ?";
        return jdbcTemplate.update(SQL, id) == 1;

    }

    @Override
    public void updateEntity(Long id, T newEntity) {

    }
}
