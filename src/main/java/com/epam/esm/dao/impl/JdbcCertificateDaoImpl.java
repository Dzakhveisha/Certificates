package com.epam.esm.dao.impl;

import com.epam.esm.dao.BaseDao;
import com.epam.esm.model.Certificate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Optional;

@Component
public class JdbcCertificateDaoImpl extends BaseDao<Certificate> {

    private static final String CERT_NAME = "name";
    private static final String CERT_DESCRIPTION = "description";
    private static final String CERT_PRICE = "price";
    private static final String CERT_DURATION = "duration";
    private static final String CERT_CREATE_DATE = "create_date";
    private static final String CERT_LAST_UPDATE_DATE = "last_update_date";

    private static final String SQL_UPDATE = "UPDATE %s SET %s WHERE id = ?";

    public JdbcCertificateDaoImpl(JdbcTemplate jdbcTemplate, RowMapper<Certificate> rowMapper) {
        super(jdbcTemplate, rowMapper);
    }

    @Override
    protected String getTableName() {
        return "certificates";
    }

    @Override
    protected String getFieldsForCreating() {
        return String.format(" (%s, %s, %s, %s, %s, %s) values (?, ?, ?, ?, ?, ?) "
                , CERT_NAME, CERT_DESCRIPTION, CERT_PRICE, CERT_DURATION, CERT_CREATE_DATE,
                CERT_LAST_UPDATE_DATE);
    }

    @Override
    protected PreparedStatement prepareStatementForInsert(PreparedStatement ps, Certificate entity) throws SQLException {
        ps.setString(1, entity.getName());
        ps.setString(2, entity.getDescription());
        ps.setLong(3, entity.getPrice());
        ps.setInt(4, entity.getDuration());
        ps.setTimestamp(5, Timestamp.valueOf(entity.getCreateDate()));
        ps.setTimestamp(6, Timestamp.valueOf(entity.getCreateDate()));
        return ps;
    }

    public Optional<Certificate> updateEntity(Long id, Certificate entity) {
        String SQL = String.format(SQL_UPDATE, getTableName(), getFieldsForUpdating(entity));
        jdbcTemplate.update(SQL, getValuesForUpdating(entity, id));
        return getEntityById(id);
    }

    private Object[] getValuesForUpdating(Certificate entity, Long id) {
        ArrayList<Object> result = new ArrayList<>();
        if (entity.getName() != null) {
            result.add(entity.getName());
        }
        if (entity.getDescription() != null) {
            result.add(entity.getDescription());
        }
        if (entity.getPrice() != null) {
            result.add(entity.getPrice());
        }
        if (entity.getDuration() != null) {
            result.add(entity.getDuration());
        }
        result.add(entity.getLastUpdateDate());
        result.add(id);
        return result.toArray();
    }

    protected String getFieldsForUpdating(Certificate entity) {
        String result = "";
        if (entity.getName() != null) {
            result += String.format(" %s = ?,", CERT_NAME);
        }
        if (entity.getDescription() != null) {
            result += String.format(" %s = ?,", CERT_DESCRIPTION);
        }
        if (entity.getPrice() != null) {
            result += String.format(" %s = ?,", CERT_PRICE);
        }
        if (entity.getDuration() != null) {
            result += String.format(" %s = ?,", CERT_DURATION);
        }
        return result + String.format(" %s = ? ", CERT_LAST_UPDATE_DATE);
    }
}
