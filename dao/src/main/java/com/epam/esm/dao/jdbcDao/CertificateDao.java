package com.epam.esm.dao.jdbcDao;

import com.epam.esm.dao.model.Certificate;

import java.util.List;
import java.util.Optional;

public interface CertificateDao extends BaseDao<Certificate>{

    Optional<Certificate> updateEntity(Long id, Certificate entity);

    List<Certificate> sortListOfEntitiesWithCriteria(String sortBy, String order, String partName, String tagName);

    }
