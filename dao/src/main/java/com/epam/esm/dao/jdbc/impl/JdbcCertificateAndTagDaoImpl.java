package com.epam.esm.dao.jdbc.impl;

import com.epam.esm.dao.jdbc.CertificateAndTagDao;
import com.epam.esm.dao.model.CertificateAndTag;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@AllArgsConstructor
public class JdbcCertificateAndTagDaoImpl implements CertificateAndTagDao {

    private static final String SQL_SELECT_BY_TAG = "SELECT * FROM certificate_tag WHERE tag_id = ? ";
    private static final String SQL_SELECT_BY_CERTIFICATE = "SELECT * FROM certificate_tag WHERE certificate_id = ? ";
    private static final String SQL_SELECT = "SELECT * FROM certificate_tag ";
    private static final String SQL_DELETE = "DELETE FROM certificate_tag WHERE (tag_id = ?) AND (certificate_id = ?) ";
    private static final String SQL_INSERT = "INSERT INTO certificate_tag (certificate_id, tag_id ) values (?, ?) ";
    private static final String SQL_SELECT_BY_TAG_AND_CERTIFICATE =
            "SELECT * FROM certificate_tag WHERE (certificate_id = ?) AND (tag_id = ?)";

    private final JdbcTemplate jdbcTemplate;
    private final RowMapper<CertificateAndTag> rowMapper;

    public List<CertificateAndTag> listOfAll() {
        return jdbcTemplate.query(SQL_SELECT, rowMapper);
    }

    @Override
    public List<Long> listOfTagsIdByCertificate(Long certificateId) {
        return jdbcTemplate.query(SQL_SELECT_BY_CERTIFICATE,
                (resultSet, i) -> resultSet.getLong("tag_id"), certificateId);
    }

    @Override
    public List<Long> listOfCertificatesIdByTags(Long tagId) {
        return jdbcTemplate.query(SQL_SELECT_BY_TAG,
                (resultSet, i) -> resultSet.getLong("certificate_id"), tagId);
    }

    @Override
    public boolean removeEntity(Long tagId, Long certificateId) {
        return jdbcTemplate.update(SQL_DELETE, tagId, certificateId) == 1;

    }

    @Override
    public CertificateAndTag createEntity(CertificateAndTag entity) {
        jdbcTemplate.update(SQL_INSERT, entity.getCertificateId(), entity.getTagId());
        return getEntityByTagAndCertificate(entity.getCertificateId(), entity.getTagId()).get();
    }

    @Override
    public Optional<CertificateAndTag> getEntityByTagAndCertificate(Long certificate_id, Long tag_id) {
        List<CertificateAndTag> certificate = jdbcTemplate.query(SQL_SELECT_BY_TAG_AND_CERTIFICATE, rowMapper,
                certificate_id, tag_id);
        if (certificate.size() == 0) {
            return Optional.empty();
        } else {
            return Optional.of(certificate.get(0));
        }
    }
}
