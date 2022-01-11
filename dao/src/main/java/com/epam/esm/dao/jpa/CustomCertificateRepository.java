package com.epam.esm.dao.jpa;

import com.epam.esm.dao.entity.Criteria;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.PageOfEntities;

public interface CustomCertificateRepository {
    PageOfEntities<Certificate> findWithCriteria(Criteria criteria, int pageNumber);
}
