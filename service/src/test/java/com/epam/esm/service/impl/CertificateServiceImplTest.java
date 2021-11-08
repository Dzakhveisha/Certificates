package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcCertificateDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.dto.CertificateDto;
import com.epam.esm.dto.TagDto;
import com.epam.esm.dto.mapper.CertificateDtoMapper;
import com.epam.esm.dto.mapper.TagDtoMapper;
import com.epam.esm.exception.CertificateNotFoundException;
import com.epam.esm.model.Certificate;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith({MockitoExtension.class})
class CertificateServiceImplTest {

    @InjectMocks
    private CertificateServiceImpl certificateService;
    @Mock
    private JdbcCertificateDaoImpl certificateDao;
    @Mock
    private JdbcCertificateAndTagDaoImpl certificateAndTagDao;
    @Mock
    private JdbcTagDaoImpl tagDao;

    private CertificateDtoMapper certificateDtoMapper;
    private TagDtoMapper tagDtoMapper;

    @BeforeEach
    void before(){
        certificateDtoMapper = new CertificateDtoMapper();
        tagDtoMapper = new TagDtoMapper();
        certificateService = new CertificateServiceImpl(certificateDao,tagDao,certificateAndTagDao,certificateDtoMapper,tagDtoMapper);

    }

    private static final TagDto[] TAGS = {
            new TagDto(1L, "tagName1"),
            new TagDto(2L, "tagName2"),
            new TagDto(3L, "tagName3")
    };

    private static final CertificateDto[] CERTIFICATES = {
            new CertificateDto(1L, "certificate1", "description1", 105L, 10,
                    "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(TAGS[0]))),
            new CertificateDto(2L, "certificate2", "description2", 108L, 10,
                    "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(TAGS[0]))),
            new CertificateDto(3L, "certificate3", "description3", 138L, 10,
                    "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(TAGS[1], TAGS[2])))
    };

    @Test
    void findByIdShouldReturnCertificateWithSuchId() {
        CertificateDto certificate = CERTIFICATES[0];

        Mockito.when(certificateDao.getEntityById(1L)).thenReturn(Optional.of(certificateDtoMapper.toEntity(certificate)));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.ofNullable(tagDtoMapper.toEntity(TAGS[0])));

        CertificateDto actual = certificateService.findById(1L);
        assertEquals(certificate, actual);
    }

    @Test
    void testFindByIdShouldThrowCertificateNotFoundException() {
        Mockito.when(certificateDao.getEntityById(199L)).thenReturn(Optional.empty());
        assertThrows(CertificateNotFoundException.class, () -> certificateService.findById(199L));
    }

    @Test
    void testFindAllShouldReturnAllCertificatesFromDb() {
        CertificateDto firstCertificate = CERTIFICATES[0];
        CertificateDto secondCertificate = CERTIFICATES[1];
        List<CertificateDto> certificates = Arrays.asList(firstCertificate, secondCertificate);
        List<Certificate> certificatesEntities = certificates
                .stream().map(certificateDtoMapper::toEntity).collect(Collectors.toList());

        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(firstCertificate.getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(secondCertificate.getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.ofNullable(tagDtoMapper.toEntity(TAGS[0])));
        Mockito.when(certificateDao.listOfEntities()).thenReturn(certificatesEntities);
        List<CertificateDto> actual = certificateService.findAll();

        assertEquals(certificates, actual);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<CertificateDto> certificates = Collections.emptyList();

        Mockito.when(certificateDao.listOfEntities()).thenReturn(certificates
                .stream().map(certificateDtoMapper::toEntity).collect(Collectors.toList()));
        List<CertificateDto> actual = certificateService.findAll();

        assertEquals(certificates, actual);
    }

    @Test
    void testCreateShouldReturnNewCertificate() {
        TagDto tag = new TagDto(1L, "tagName1");
        Certificate newCertificate = new Certificate(null, "certificate1", "description1", 105L, 10,
                LocalDateTime.of(2021,11,6,11,0,0), LocalDateTime.of(2021,11,6,11,0,0));

        CertificateDto newCertificateInDb = new CertificateDto(6L, "certificate1", "description1", 105L, 10,
                "2021-11-06 11:00:00", "2021-11-06 11:00:00", Collections.emptyList());

        Mockito.when(certificateDao.createEntity(newCertificate)).thenReturn(certificateDtoMapper.toEntity(newCertificateInDb));

        CertificateDto actual = certificateService.create(certificateDtoMapper.toDTO(newCertificate));

        assertEquals(6L, actual.getId());
    }

    @Test
    void testUpdateShouldReturnUpdateCertificate() {
        TagDto tag = TAGS[2];
        CertificateDto certificateForUpdateDto = new CertificateDto(1L, "certificateUP", "up", null,
                null,null, "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(tag)));

        CertificateDto updatingCertificate = new CertificateDto(1L, "certificateUP", "up", 105L, 10,
                "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(tag)));
        updatingCertificate.setId(1L);

        Mockito.when(certificateDao.updateEntity(certificateForUpdateDto.getId(), certificateDtoMapper.toEntity(certificateForUpdateDto)))
                .thenReturn(Optional.of(certificateDtoMapper.toEntity(updatingCertificate)));

        CertificateDto actual = certificateService.update(certificateForUpdateDto.getId(), certificateForUpdateDto);

        assertEquals(updatingCertificate.getName(), actual.getName());
    }

    @Test
    void testUpdateShouldThrowCertificateNotFoundExceptionIfItIsNotExistInDb() {
        TagDto tag = TAGS[2];
        CertificateDto certificateForUpdateDto = new CertificateDto(222L, "certificateUP", "up", null,
                null,null, "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(tag)));

        Certificate certificateForUpdate = certificateDtoMapper.toEntity(certificateForUpdateDto);

        Mockito.when(certificateDao.updateEntity(222L,  certificateForUpdate)).thenReturn(Optional.empty());

        assertThrows(CertificateNotFoundException.class, () -> certificateService.update(222L, certificateForUpdateDto));
    }

    @Test
    void testRemove() {
        TagDto firstTag = TAGS[1];
        TagDto secondTag = TAGS[2];
        CertificateDto certificate = CERTIFICATES[2];

        Mockito.when(certificateDao.getEntityById(certificate.getId())).thenReturn(Optional.of(certificateDtoMapper.toEntity(certificate)));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId()))
                .thenReturn(new ArrayList<>(Arrays.asList(firstTag.getId(), secondTag.getId())));

        certificateService.remove(certificate.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(firstTag.getId(), certificate.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(secondTag.getId(), certificate.getId());
    }

    @Test
    void testSortAllWithCriteria() {
        List<CertificateDto> certificatesDto = new ArrayList<>(Arrays.asList(CERTIFICATES[1], CERTIFICATES[0]));
        List<Certificate> certificates = certificatesDto.stream().map(certificateDtoMapper::toEntity).collect(Collectors.toList());

        Mockito.when(certificateDao.sortListOfEntitiesWithCriteria("name", "DESK", "certificate", TAGS[0].getName())).thenReturn(certificates);
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificates.get(0).getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificates.get(1).getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.ofNullable(tagDtoMapper.toEntity(TAGS[0])));

        List<CertificateDto> actual = certificateService.sortAllWithCriteria("name", "DESK", "certificate", TAGS[0].getName());

        assertEquals(certificatesDto, actual);
    }
}