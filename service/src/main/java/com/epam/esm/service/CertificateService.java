package com.epam.esm.service;

import com.epam.esm.dto.CertificateDto;
import com.epam.esm.exception.CertificateNotFoundException;

import java.util.List;

public interface CertificateService {

    CertificateDto findById(Long id) throws CertificateNotFoundException;

    List<CertificateDto> findAll();

    CertificateDto create(CertificateDto entity);

    CertificateDto update(Long id, CertificateDto entity);

    boolean remove(Long id);

    List<CertificateDto> sortAllWithCriteria(String sortBy, String order, String partName, String tagName);
}