package com.epam.esm.mapper;

import com.epam.esm.model.CertificateAndTag;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class CertificateAndTagRowMapper implements RowMapper<CertificateAndTag> {
    private static final String CERTIFICATE_ID = "certificate_id";
    private static final String TAG_ID = "tag_id";

    @Override
    public CertificateAndTag mapRow(ResultSet resultSet, int i) throws SQLException {
        CertificateAndTag certificateAndTag = new CertificateAndTag();
        certificateAndTag.setCertificateId(resultSet.getLong(CERTIFICATE_ID));
        certificateAndTag.setTagId(resultSet.getLong(TAG_ID));
        return certificateAndTag;
    }
}
