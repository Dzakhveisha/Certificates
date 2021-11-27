package com.epam.esm.service;

import com.epam.esm.service.model.dto.CertificateDto;
import com.epam.esm.dao.model.Criteria;

import java.util.List;

public interface CertificateService {

    /**
     * Find certificate by it's id
     *
     * @param id certificate's id
     * @return found certificate
     */
    CertificateDto findById(Long id);

    /**
     * find all certificates
     *
     * @param  pageNumber number of page
     * @return list of certificates
     */
    List<CertificateDto> findAll(int pageNumber);

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
     * Get list of certificate, sorted by sortBy field with needed order, which searching by part of name and tag name
     *
     * @param criteria criteria with all parameters for search and sort
     * @return sorted in needed order list of found certificates
     */
    List<CertificateDto> sortAllWithCriteria(Criteria criteria, int pageNumber);
}