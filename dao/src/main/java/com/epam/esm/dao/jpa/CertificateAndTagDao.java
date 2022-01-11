package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateToTagRelation;
import com.epam.esm.dao.model.Tag;

import java.util.List;
import java.util.Optional;

/**
 * DAO for CertificateToTagRelation entity
 */
public interface CertificateAndTagDao {


    /**
     * Get list of tags, which are included in certificate
     *
     * @param certificateId id of certificate, by which tags are searched
     * @return list of tags, which are included in certificate
     */
    List<Tag> findTagsByCertificate(Long certificateId);


    /**
     * Get list of certificates, which are contains such tag
     *
     * @param tagId id of tag, by which certificates are searched
     * @return list of certificates, which are contains such tag
     */
    List<Certificate> findCertificatesByTags(Long tagId);

    /**
     * Remove entity with such id in database
     *
     * @param tagId         value of field tag's Id in removable entity
     * @param certificateId value of field certificate's Id in removable entity
     * @return true, if successful deletion, else false
     */
    boolean remove(Long tagId, Long certificateId);

    /**
     * Create new entity in database
     *
     * @param entity CertificateAnsTag entity for creating
     * @return created entity from database
     */
    CertificateToTagRelation create(CertificateToTagRelation entity);

    /**
     * Get entity by it's tag_id and certificate_id from database
     *
     * @param certificateId value of field certificate's Id in needed entity
     * @param tagId         value of field tag's Id in needed entity
     * @return return needed entity
     */
    Optional<CertificateToTagRelation> findByTagAndCertificate(Long certificateId, Long tagId);
}
