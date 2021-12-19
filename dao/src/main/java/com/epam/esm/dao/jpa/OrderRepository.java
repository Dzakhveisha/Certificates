package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * DAO for Order entity
 */
public interface OrderRepository extends JpaRepository<Order, Long> {

    Page<Order> findByUserId(Long id, Pageable pageable);

    List<Order> findByCertificate(Certificate certificate);

    void deleteByUserIdAndCertificateId(Long userId, Long CertificateId);
}
