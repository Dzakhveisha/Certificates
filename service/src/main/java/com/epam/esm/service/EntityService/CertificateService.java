package com.epam.esm.service.EntityService;

import com.epam.esm.service.exception.CertificateNotFoundException;
import com.epam.esm.service.model.dto.CertificateDto;

import java.util.List;

public interface CertificateService {

    CertificateDto findById(Long id) throws CertificateNotFoundException;

    List<CertificateDto> findAll();

    CertificateDto create(CertificateDto entity);

    CertificateDto update(Long id, CertificateDto entity);

    void remove(Long id);

    List<CertificateDto> sortAllWithCriteria(String sortBy, String order, String partName, String tagName);
}