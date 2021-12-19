package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.entity.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * DAO for Certificate entity
 */
public interface CertificateRepository extends JpaRepository<Certificate, Long> {

}
