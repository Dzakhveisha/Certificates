package com.epam.esm.dao.impl;

import com.epam.esm.config.DBConfig;
import com.epam.esm.model.Certificate;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.jdbc.JdbcTestUtils.*;

@Profile("dev")
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {DBConfig.class})
class JdbcCertificateDaoImplTest {

    @Autowired
    private JdbcCertificateDaoImpl certificateDao;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    void testGetEntityByIdShouldReturnCertificateFromDB() {
        long id = 1L;
        Certificate certificate = certificateDao.getEntityById(id).get();
        assertEquals(certificate.getId(), id);
    }

    @Test
    void testGetEntityByIdShouldReturnNull() {
        long id = 738L;
        Optional<Certificate> certificate = certificateDao.getEntityById(id);
        assertEquals(Optional.empty(), certificate);
    }


    @Test
    void testListOfEntitiesShouldReturnAllCertificatesInDb() {
        int entitiesCount = 4;
        List<Certificate> certificates = certificateDao.listOfEntities();
        assertEquals(entitiesCount, certificates.size());
    }

    @Test
    void testCreateEntityShouldReturnNewEntityInDbWithUniqueId() {
        Certificate certificate = new Certificate(1L, "certificate1", "description1", 105L, 10,
                LocalDateTime.now(), LocalDateTime.now(), null);

        Certificate actual = certificateDao.createEntity(certificate);
        assertEquals(actual.getId(), 6L);
    }

    @Test
    void testRemoveEntityShouldReturnTrueIfEntityIsDeleted() {
        long id = 1L;
        boolean actual = certificateDao.removeEntity(id);
        assertTrue(actual);
    }

    @Test
    void testRemoveEntityShouldReturnFalseIfEntityIsNotFound() {
        long id = 738L;
        boolean actual = certificateDao.removeEntity(id);
        assertFalse(actual);
    }

    @Test
    void testUpdateShouldReturnUpdatedEntityFromDb() {
        Certificate certificate = new Certificate(3L, "UPDATE", "UPDATE", null,
                null, null, LocalDateTime.now(), null);

        Certificate oldCertificate = certificateDao.getEntityById(certificate.getId()).get();
        certificate.setCreateDate(oldCertificate.getCreateDate());
        Optional<Certificate> actual = certificateDao.updateEntity(certificate.getId(), certificate);

        assertEquals(actual.get().getName(), certificate.getName());
        assertEquals(actual.get().getName(), certificate.getName());
        assertEquals(actual.get().getDescription(), certificate.getDescription());
        assertEquals(actual.get().getPrice(), oldCertificate.getPrice());
    }

    @Test
    void sortListOfEntitiesWithCriteria() {
        List<Certificate> actualListOfEntitiesWithCriteria = certificateDao.sortListOfEntitiesWithCriteria("id", "ASC", "", null);
        List<Certificate> listOfEntities = certificateDao.listOfEntities();
        assertEquals(actualListOfEntitiesWithCriteria, listOfEntities);
    }
}