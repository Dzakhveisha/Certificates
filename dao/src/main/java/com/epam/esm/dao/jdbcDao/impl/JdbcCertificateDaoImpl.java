package com.epam.esm.dao.jdbcDao.impl;

import com.epam.esm.dao.jdbcDao.BaseDao;
import com.epam.esm.dao.model.Certificate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
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
    private static final String SQL_ORDER_BY_DESC = " ORDER BY %s DESC";
    private static final String SQL_ORDER_BY_ASC = " ORDER BY %s ASC";
    private static final String SQL_WHERE_LIKE = " WHERE ((name LIKE '%%%s%%') OR ( description LIKE '%%%s%%')) AND (%s)";
    private static final String SQL_WHERE_TAG_NAME = " EXISTS ( SELECT * FROM certificate_tag WHERE (certificate_id=id) AND ( tag_id = (SELECT id FROM tags WHERE name = '%s')))";


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
    protected PreparedStatement prepareStatementForInsert(PreparedStatement preparedStatement, Certificate entity) throws SQLException {
        preparedStatement.setString(1, entity.getName());
        preparedStatement.setString(2, entity.getDescription());
        preparedStatement.setLong(3, entity.getPrice());
        preparedStatement.setInt(4, entity.getDuration());
        preparedStatement.setTimestamp(5, Timestamp.valueOf(entity.getCreateDate()));
        preparedStatement.setTimestamp(6, Timestamp.valueOf(entity.getCreateDate()));
        return preparedStatement;
    }

    public Optional<Certificate> updateEntity(Long id, Certificate entity) {
        entity.setLastUpdateDate(LocalDateTime.now());
        String SQL = String.format(SQL_UPDATE, getTableName(), getFieldsForUpdating(entity));
        jdbcTemplate.update(SQL, getValuesForUpdating(entity, id));
        return getEntityById(id);
    }

    public List<Certificate> sortListOfEntitiesWithCriteria(String sortBy, String order, String partName, String tagName) {
        if (!sortBy.equals("name") && !sortBy.equals("create_date")){
            sortBy = "id";
        }
        String SQL;
        if (tagName != null) {
            final String sqlWhereLikeWithTagName = String.format(SQL_WHERE_LIKE, partName, partName, String.format(SQL_WHERE_TAG_NAME, tagName));
            if (order.equals("DESC")) {
                SQL = SQL_SELECT + getTableName() + sqlWhereLikeWithTagName + String.format(SQL_ORDER_BY_DESC, sortBy);
            } else {
                SQL = SQL_SELECT + getTableName() + sqlWhereLikeWithTagName + String.format(SQL_ORDER_BY_ASC, sortBy);
            }

        } else {
            if (order.equals("DESC")) {
                SQL = SQL_SELECT + getTableName() + String.format(SQL_WHERE_LIKE, partName, partName, "TRUE") + String.format(SQL_ORDER_BY_DESC, sortBy);
            } else {
                SQL = SQL_SELECT + getTableName() + String.format(SQL_WHERE_LIKE, partName, partName, "TRUE") + String.format(SQL_ORDER_BY_ASC, sortBy);
            }
        }
        return jdbcTemplate.query(SQL, rowMapper);
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
