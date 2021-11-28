package com.epam.esm.dao.jdbc;

import com.epam.esm.dao.model.CertificateAndTag;

import java.util.List;
import java.util.Optional;

/**
 * DAO for CertificateAndTag entity
 */
public interface CertificateAndTagDao {

    /**
     * Get list of tags, which are included in certificate
     *
     * @param certificateId id of certificate, by which tags are searched
     * @return list of tags, which are included in certificate
     */
    List<Long> listOfTagsIdByCertificate(Long certificateId);

    /**
     * Get list of certificates, which are contains such tag
     *
     * @param tagId id of tag, by which certificates are searched
     * @return list of certificates, which are contains such tag
     */
    List<Long> listOfCertificatesIdByTags(Long tagId);

    /**
     * Remove entity with such id in database
     *
     * @param tagId         value of field tag's Id in removable entity
     * @param certificateId value of field certificate's Id in removable entity
     * @return true, if successful deletion, else false
     */
    boolean removeEntity(Long tagId, Long certificateId);

    /**
     * Create new entity in database
     *
     * @param entity CertificateAnsTag entity for creating
     * @return created entity from database
     */
    CertificateAndTag createEntity(CertificateAndTag entity);

    /**
     * Get entity by it's tag_id and certificate_id from database
     *
     * @param certificate_id value of field certificate's Id in needed entity
     * @param tag_id         value of field tag's Id in needed entity
     * @return return needed entity
     */
    Optional<CertificateAndTag> getEntityByTagAndCertificate(Long certificate_id, Long tag_id);
}
