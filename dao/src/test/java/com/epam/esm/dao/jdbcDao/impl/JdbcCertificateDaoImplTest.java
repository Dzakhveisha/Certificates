package com.epam.esm.dao.jdbcDao.impl;

import com.epam.esm.dao.config.DBConfig;
import com.epam.esm.dao.config.TransactionConfig;
import com.epam.esm.dao.model.Certificate;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@ActiveProfiles("dev")
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {DBConfig.class, TransactionConfig.class})
@Transactional
class JdbcCertificateDaoImplTest {

    @Autowired
    private JdbcCertificateDaoImpl certificateDao;

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
        int entitiesCount = 5;
        List<Certificate> certificates = certificateDao.listOfEntities();
        assertEquals(entitiesCount, certificates.size());
    }

    @Test
    void testCreateEntityShouldReturnNewEntityInDbWithUniqueId() {
        Certificate certificate = new Certificate(1L, "certificate1", "description1", 105L, 10,
                LocalDateTime.now(), LocalDateTime.now());

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
                null, null, LocalDateTime.now());

        Certificate oldCertificate = certificateDao.getEntityById(certificate.getId()).get();
        certificate.setCreateDate(oldCertificate.getCreateDate());
        Certificate actual = certificateDao.updateEntity(certificate.getId(), certificate).get();

        assertEquals(actual.getName(), certificate.getName());
        assertEquals(actual.getName(), certificate.getName());
        assertEquals(actual.getDescription(), certificate.getDescription());
        assertEquals(actual.getPrice(), oldCertificate.getPrice());
    }

    @Test
    void sortListOfEntitiesWithCriteria() {
        List<Certificate> actualListOfEntitiesWithCriteria = certificateDao.sortListOfEntitiesWithCriteria("id", "ASC", "", null);
        List<Certificate> listOfEntities = certificateDao.listOfEntities();
        assertEquals(actualListOfEntitiesWithCriteria, listOfEntities);
    }
}