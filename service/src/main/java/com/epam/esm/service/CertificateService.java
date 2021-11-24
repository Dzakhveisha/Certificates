package com.epam.esm.service;

import com.epam.esm.service.model.dto.CertificateDto;

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
     * @return list of certificates
     */
    List<CertificateDto> findAll();

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
     * @param sortBy   field, by which all certificates will be sorted
     * @param order    order of sorting (DESC or ASC)
     * @param partName part of name or description of certificate, by which will be searching
     * @param tagNames  names of tag, by which will be certificate's searching
     * @return sorted in needed order list of found certificates
     */
    List<CertificateDto> sortAllWithCriteria(String sortBy, String order, String partName, List<String> tagNames);
}