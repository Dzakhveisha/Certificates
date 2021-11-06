package com.epam.esm.mapper;

import com.epam.esm.model.Certificate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Component
public class CertificateRowMapper implements RowMapper<Certificate> {

    private static final String CERT_ID = "id";
    private static final String CERT_NAME = "name";
    private static final String CERT_DESCRIPTION = "description";
    private static final String CERT_PRICE = "price";
    private static final String CERT_DURATION = "duration";
    private static final String CERT_CREATE_DATE = "create_date";
    private static final String CERT_LAST_UPDATE_DATE = "last_update_date";

    @Override
    public Certificate mapRow(ResultSet resultSet, int i) throws SQLException {
        Certificate certificate = Certificate.builder()
                .name(resultSet.getString(CERT_NAME))
                .description(resultSet.getString(CERT_DESCRIPTION))
                .price(resultSet.getLong(CERT_PRICE))
                .duration(resultSet.getInt(CERT_DURATION))
                .createDate(resultSet.getTimestamp(CERT_CREATE_DATE).toLocalDateTime())
                .lastUpdateDate(resultSet.getTimestamp(CERT_LAST_UPDATE_DATE).toLocalDateTime())
                .tags(new ArrayList<>())
                .build();
        certificate.setId(resultSet.getLong(CERT_ID));
        return certificate;
    }
}
