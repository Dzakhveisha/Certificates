package com.epam.esm.dao.jdbcDao;

import com.epam.esm.dao.model.CertificateAndTag;

import java.util.List;
import java.util.Optional;

public interface CertificateAndTagDao{
    List<Long> listOfTagsIdByCertificate(Long certificateId);

    List<Long> listOfCertificatesIdByTags(Long tagId);

    boolean removeEntity(Long tagId, Long certificateId);

    CertificateAndTag createEntity(CertificateAndTag entity);

    Optional<CertificateAndTag> getEntityByTagAndCertificate(Long certificate_id, Long tag_id) ;
}
