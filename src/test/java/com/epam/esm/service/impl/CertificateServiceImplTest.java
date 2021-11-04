package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcCertificateDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.model.Certificate;
import com.epam.esm.model.Tag;
import com.epam.esm.service.exception.CertificateNotFoundException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class CertificateServiceImplTest {

    @InjectMocks
    private CertificateServiceImpl certificateService;
    @Mock
    private JdbcCertificateDaoImpl certificateDao;
    @Mock
    private JdbcCertificateAndTagDaoImpl certificateAndTagDao;
    @Mock
    private JdbcTagDaoImpl tagDao;

    private static final Tag[] TAGS = {
            new Tag(1L, "tagName1"),
            new Tag(2L, "tagName2"),
            new Tag(3L, "tagName3")
    };

    private static final Certificate[] CERTIFICATES = {
            new Certificate(1l, "certificate1", "description1", 105L, 10,
                    LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Arrays.asList(TAGS[0]))),
            new Certificate(2L, "certificate2", "description2", 108L, 10,
                    LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Arrays.asList(TAGS[0]))),
            new Certificate(3L, "certificate3", "description3", 138L, 10,
                    LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Arrays.asList(TAGS[1], TAGS[2])))
    };

    @Test
    void findByIdShouldReturnCertificateWithSuchId() {
        Certificate certificate1 = CERTIFICATES[0];
        Mockito.when(certificateDao.getEntityById(1L)).thenReturn(Optional.of(certificate1));
        final Certificate actual = certificateService.findById(1L);
        assertEquals(certificate1, actual);
        assertNotNull(actual);
    }

    @Test
    void testFindByIdShouldThrowCertificateNotFoundException() {
        Mockito.when(certificateDao.getEntityById(199L)).thenReturn(Optional.empty());
        assertThrows(CertificateNotFoundException.class, () -> certificateService.findById(199L));
    }

    @Test
    void testFindAllShouldReturnAllCertificatesFromDb() {
        Certificate certificate1 = CERTIFICATES[0];
        Certificate certificate2 = CERTIFICATES[1];
        List<Certificate> certificates = Arrays.asList(certificate1, certificate2);
        Mockito.when(certificateDao.listOfEntities()).thenReturn(certificates);
        final List<Certificate> actual = certificateService.findAll();
        assertEquals(certificates, actual);
        assertNotNull(actual);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<Certificate> certificates = Collections.emptyList();
        Mockito.when(certificateDao.listOfEntities()).thenReturn(certificates);
        final List<Certificate> actual = certificateService.findAll();
        assertEquals(certificates, actual);
        assertNotNull(actual);
    }

    @Test
    void testCreateShouldReturnNewCertificate() {
        Tag tag = new Tag("tagName1");
        tag.setId(1L);
        Certificate newCertificate = new Certificate("certificate1", "description1", 105L, 10,
                LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Arrays.asList(TAGS[0])));
        Certificate newCertificateInDb = CERTIFICATES[0];

        Mockito.when(certificateDao.createEntity(newCertificate)).thenReturn(newCertificateInDb);
        Mockito.when(tagDao.getEntityById(tag.getId())).thenReturn(Optional.of(tag));
        final Certificate actual = certificateService.create(newCertificate);

        assertEquals(newCertificateInDb, actual);
        assertNotNull(actual);
    }

    @Test
    void testUpdateShouldReturnUpdateCertificate() {
        Tag tag = TAGS[0];
        Certificate certificateForUpdate = new Certificate(1L, "certificateUP", null, null, null,
                null, null, new ArrayList<>(Arrays.asList(tag)));

        Certificate updatedCertificate = new Certificate(1L, "certificateUP", "description1", 105L, 10,
                LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Arrays.asList(tag)));
        updatedCertificate.setId(1L);

        Mockito.when(certificateDao.updateEntity(certificateForUpdate.getId(), certificateForUpdate))
                .thenReturn(Optional.of(updatedCertificate));

        Mockito.when(tagDao.getEntityById(tag.getId())).thenReturn(Optional.of(tag));
        final Certificate actual = certificateService.update(certificateForUpdate.getId(), certificateForUpdate);

        assertEquals(updatedCertificate, actual);
        assertNotNull(actual);
    }

    @Test
    void testUpdateShouldThrowCertificateNotFoundExceptionIfItIsNotExistInDb() {
        Tag tag = TAGS[0];

        Certificate certificateForUpdate = new Certificate(1L, "certificateUP", null, null, null,
                null, null, new ArrayList<>(Arrays.asList(tag)));

        Mockito.when(certificateDao.updateEntity(certificateForUpdate.getId(), certificateForUpdate))
                .thenReturn(Optional.empty());

        assertThrows(CertificateNotFoundException.class, () -> certificateService.update(certificateForUpdate.getId(), certificateForUpdate));
    }

    @Test
    void testRemove() {
        Tag tag1 = TAGS[1];
        Tag tag2 = TAGS[2];
        Certificate certificate = CERTIFICATES[2];

        Mockito.when(certificateDao.getEntityById(certificate.getId())).thenReturn(Optional.of(certificate));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId()))
                .thenReturn(new ArrayList<>(Arrays.asList(tag1.getId(), tag2.getId())));

        certificateService.remove(certificate.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag1.getId(), certificate.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag2.getId(), certificate.getId());
    }

    @Test
    void testSortAllWithCriteria() {
        List<Certificate> certificates = new ArrayList<>(Arrays.asList(CERTIFICATES[1], CERTIFICATES[0]));

        Mockito.when(certificateDao.sortListOfEntitiesWithCriteria("name","DESK","certificate",TAGS[0].getName()))
                .thenReturn(certificates);
        final List<Certificate> actual = certificateService.sortAllWithCriteria("name","DESK","certificate",TAGS[0].getName());
        assertEquals(certificates, actual);
        assertNotNull(actual);
    }
}