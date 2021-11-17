package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Certificate;

import java.util.List;
import java.util.Optional;

/**
 * DAO for Certificate entity
 */
public interface CertificateDao extends BaseDao<Certificate> {

    /**
     * Update certificate entity with such id in database
     *
     * @param id     id of entity to update
     * @param entity entity with updated fields
     * @return updated certificate from database
     */
    Optional<Certificate> updateEntity(Long id, Certificate entity);

    /**
     * Get list of certificate, sorted by sortBy field with needed order, which searching by part of name and tag name in database
     *
     * @param sortBy   field, by which all certificates will be sorted
     * @param order    order of sorting (DESC or ASC)
     * @param partName part of name or description of certificate, by which will be searching
     * @param tagName  name of tag, by which will be certificate's searching
     * @return sorted in needed order list of found certificates
     */
    List<Certificate> sortListOfEntitiesWithCriteria(String sortBy, String order, String partName, String tagName);

}
