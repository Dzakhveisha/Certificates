package com.epam.esm.service;

import com.epam.esm.model.Certificate;
import com.epam.esm.exception.CertificateNotFoundException;

import java.util.List;

public interface CertificateService {

    Certificate findById(Long id) throws CertificateNotFoundException;

    List<Certificate> findAll();

    Certificate create(Certificate entity);

    Certificate update(Long id, Certificate entity);

    boolean remove(Long id);

    List<Certificate> sortAllWithCriteria(String sortBy, String order, String partName, String tagName);
}
