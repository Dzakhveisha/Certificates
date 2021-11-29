package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Criteria;
import com.epam.esm.dao.model.PageOfEntities;

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
    Optional<Certificate> update(Long id, Certificate entity);

    /**
     * Get page of certificate, sorted by sortBy field with needed order, which searching by part of name and tag name in database
     *
     * @param criteria criteria with all parameters for search and sort
     * @return page of sorted in needed order list of found certificates
     */
    PageOfEntities<Certificate> sortListWithCriteria(Criteria criteria, int pageNumber);

}
