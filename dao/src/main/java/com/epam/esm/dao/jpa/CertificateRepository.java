package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Certificate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * DAO for Certificate entity
 */
public interface CertificateRepository extends JpaRepository<Certificate, Long>,
        JpaSpecificationExecutor<Certificate> {


}
