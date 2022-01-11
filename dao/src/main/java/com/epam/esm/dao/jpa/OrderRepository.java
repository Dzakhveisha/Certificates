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

    /**
     * Find all orders of user
     *
     * @param id       user id
     * @param pageable needed page
     * @return page of orders
     */
    Page<Order> findByUserId(Long id, Pageable pageable);

    /**
     * Find all orders with certificate
     *
     * @param certificate certificate
     * @return list of orders
     */
    List<Order> findByCertificate(Certificate certificate);

    /**
     * find and delete  order with such user and certificate
     *
     * @param userId        id of usr
     * @param CertificateId id of certificate
     */
    void deleteByUserIdAndCertificateId(Long userId, Long CertificateId);
}
