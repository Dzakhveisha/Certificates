package com.epam.esm.service;

import com.epam.esm.dao.entity.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.model.dto.CertificateDto;
import org.springframework.data.domain.Page;

public interface CertificateService {

    /**
     * Find certificate by it's id
     *
     * @param id certificate's id
     * @return found certificate
     */
    CertificateDto findById(Long id);

    /**
     * find page of all certificates
     *
     * @param pageNumber number of page
     * @return page of certificates
     */
    Page<CertificateDto> findAll(int pageNumber);

    /**
     * Create certificate
     *
     * @param entity certificate to create
     * @return created certificate
     */
    CertificateDto create(CertificateDto entity);

    /**
     * Update certificate
     *
     * @param id     id of certificate to update
     * @param entity certificate with new values of fields
     * @return updated entity
     */
    CertificateDto update(Long id, CertificateDto entity);

    /**
     * Remove certificate with such id
     *
     * @param id id of certificate
     */
    void remove(Long id);

    /**
     * Get page of certificate, sorted by sortBy field with needed order, which searching by part of name and tag name
     *
     * @param criteria criteria with all parameters for search and sort
     * @return page of sorted in needed order list of found certificates
     */
    PageOfEntities<CertificateDto> sortAllWithCriteria(Criteria criteria, int pageNumber);
}