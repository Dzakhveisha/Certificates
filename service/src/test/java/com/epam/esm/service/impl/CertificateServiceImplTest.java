package com.epam.esm.service.impl;

import com.epam.esm.dao.jdbc.CertificateAndTagDao;
import com.epam.esm.dao.jdbc.CertificateDao;
import com.epam.esm.dao.jdbc.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.exception.CertificateNotFoundException;
import com.epam.esm.service.mapper.CertificateDtoMapper;
import com.epam.esm.service.mapper.TagDtoMapper;
import com.epam.esm.service.model.dto.CertificateDto;
import com.epam.esm.service.model.dto.TagDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith({MockitoExtension.class})
class CertificateServiceImplTest {

    @InjectMocks
    private CertificateServiceImpl certificateService;
    @Mock
    private CertificateDao certificateDao;
    @Mock
    private CertificateAndTagDao certificateAndTagDao;
    @Mock
    private TagDao tagDao;

    private static final String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
    private static final DateTimeFormatter formatterToLocalDateTime = DateTimeFormatter.ofPattern(DATE_TIME_PATTERN);

    private static final TagDto[] TAGS_DTO = {
            new TagDto(1L, "tagName1"),
            new TagDto(2L, "tagName2"),
            new TagDto(3L, "tagName3")
    };

    private static final CertificateDto[] CERTIFICATES_DTO = {
            new CertificateDto(1L, "certificate1", "description1", 105L, 10,
                    "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(TAGS_DTO[0]))),
            new CertificateDto(2L, "certificate2", "description2", 108L, 10,
                    "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(TAGS_DTO[0]))),
            new CertificateDto(3L, "certificate3", "description3", 138L, 10,
                    "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(TAGS_DTO[1], TAGS_DTO[2])))
    };

    private static final Tag[] TAGS = {
            new Tag(1L, "tagName1"),
            new Tag(2L, "tagName2"),
            new Tag(3L, "tagName3")
    };

    private static final Certificate[] CERTIFICATES = {
            new Certificate(1L, "certificate1", "description1", 105L, 10,
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime),
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new Certificate(2L, "certificate2", "description2", 108L, 10,
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime),
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
            new Certificate(3L, "certificate3", "description3", 138L, 10,
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime),
                    LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime)),
    };


    @BeforeEach
    void before() {
        certificateService = new CertificateServiceImpl(certificateDao, tagDao, certificateAndTagDao,
                new CertificateDtoMapper(), new TagDtoMapper());
    }

    @Test
    void findByIdShouldReturnCertificateWithSuchId() {
        CertificateDto certificateDto = CERTIFICATES_DTO[1];
        Certificate certificate = CERTIFICATES[1];

        Mockito.when(certificateDao.getEntityById(2L)).thenReturn(Optional.of(certificate));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificateDto.getId())).thenReturn(Arrays.asList(2L));
        Mockito.when(tagDao.getEntityById(2L)).thenReturn(Optional.of(TAGS[0]));

        CertificateDto actual = certificateService.findById(2L);
        assertEquals(certificateDto, actual);
    }

    @Test
    void testFindByIdShouldThrowCertificateNotFoundException() {
        Mockito.when(certificateDao.getEntityById(199L)).thenReturn(Optional.empty());
        assertThrows(CertificateNotFoundException.class, () -> certificateService.findById(199L));
    }

    @Test
    void testFindAllShouldReturnAllCertificatesFromDb() {
        CertificateDto firstCertificate = CERTIFICATES_DTO[0];
        CertificateDto secondCertificate = CERTIFICATES_DTO[1];
        List<CertificateDto> certificatesDto = Arrays.asList(firstCertificate, secondCertificate);
        List<Certificate> certificatesEntities = Arrays.asList(CERTIFICATES[0], CERTIFICATES[1]);

        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(firstCertificate.getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(secondCertificate.getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.of(TAGS[0]));
        Mockito.when(certificateDao.listOfEntities()).thenReturn(certificatesEntities);

        List<CertificateDto> actual = certificateService.findAll();
        assertEquals(certificatesDto, actual);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<CertificateDto> certificatesDto = Collections.emptyList();
        List<Certificate> certificates = Collections.emptyList();

        Mockito.when(certificateDao.listOfEntities()).thenReturn(certificates);
        List<CertificateDto> actual = certificateService.findAll();

        assertEquals(certificatesDto, actual);
    }

    @Test
    void testCreateShouldReturnNewCertificate() {
        CertificateDto certificateDto = CERTIFICATES_DTO[0];
        Certificate newCertificate = CERTIFICATES[0];

        Mockito.when(certificateDao.createEntity(Mockito.any())).thenReturn(newCertificate);
        Mockito.when(tagDao.getTagByName(TAGS[0].getName())).thenReturn(Optional.of(TAGS[0]));
        CertificateDto actual = certificateService.create(certificateDto);

        assertEquals(certificateDto.getId(), actual.getId());
        assertEquals(certificateDto.getName(), actual.getName());
    }

    @Test
    void testUpdateShouldReturnUpdateCertificate() {
        TagDto tagDto = TAGS_DTO[2];
        Tag tag = TAGS[2];

        CertificateDto certificateForUpdateDto = new CertificateDto(1L, "certificateUP", "up", null,
                null, null, "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(tagDto)));
        Certificate certificateForUpdate = new Certificate(1L, "certificateUP", "up", null,
                null, null, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime));

        CertificateDto updatingCertificateDto = new CertificateDto(1L, "certificateUP", "up", 105L, 10,
                "2021-11-06 11:00:00", "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(tagDto)));
        Certificate updatingCertificate = new Certificate(1L, "certificateUP", "up", 105L, 10,
                LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime), LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime));

        Mockito.when(tagDao.getTagByName(tagDto.getName())).thenReturn(Optional.of(tag));
        Mockito.when(certificateDao.updateEntity(certificateForUpdateDto.getId(), certificateForUpdate))
                .thenReturn(Optional.of(updatingCertificate));

        CertificateDto actual = certificateService.update(certificateForUpdateDto.getId(), certificateForUpdateDto);

        assertEquals(updatingCertificateDto.getName(), actual.getName());
    }

    @Test
    void testUpdateShouldThrowCertificateNotFoundExceptionIfItIsNotExistInDb() {
        TagDto tag = TAGS_DTO[2];
        CertificateDto certificateForUpdateDto = new CertificateDto(222L, "certificateUP", "up", null,
                null, null, "2021-11-06 11:00:00", new ArrayList<>(Arrays.asList(tag)));
        Certificate certificateForUpdate = new Certificate(222L, "certificateUP", "up", null,
                null, null, LocalDateTime.parse("2021-11-06 11:00:00", formatterToLocalDateTime));

        Mockito.when(certificateDao.updateEntity(222L, certificateForUpdate)).thenReturn(Optional.empty());

        assertThrows(CertificateNotFoundException.class, () -> certificateService.update(222L, certificateForUpdateDto));
    }

    @Test
    void testRemove() {
        TagDto firstTag = TAGS_DTO[1];
        TagDto secondTag = TAGS_DTO[2];
        CertificateDto certificateDto = CERTIFICATES_DTO[2];
        Certificate certificate = CERTIFICATES[2];

        Mockito.when(certificateDao.removeEntity(certificateDto.getId())).thenReturn(true);
        Mockito.when(certificateDao.getEntityById(certificateDto.getId())).thenReturn(Optional.of(certificate));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificateDto.getId()))
                .thenReturn(new ArrayList<>(Arrays.asList(firstTag.getId(), secondTag.getId())));

        certificateService.remove(certificateDto.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(firstTag.getId(), certificateDto.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(secondTag.getId(), certificateDto.getId());
    }

    @Test
    void testSortAllWithCriteria() {
        List<CertificateDto> certificatesDto = new ArrayList<>(Arrays.asList(CERTIFICATES_DTO[1], CERTIFICATES_DTO[0]));
        List<Certificate> certificates = new ArrayList<>(Arrays.asList(CERTIFICATES[1], CERTIFICATES[0]));

        Mockito.when(certificateDao.sortListOfEntitiesWithCriteria("name", "DESK", "certificate", TAGS_DTO[0].getName())).thenReturn(certificates);
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificates.get(0).getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(certificateAndTagDao.listOfTagsIdByCertificate(certificates.get(1).getId())).thenReturn(Arrays.asList(1L));
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.ofNullable(TAGS[0]));

        List<CertificateDto> actual = certificateService.sortAllWithCriteria("name", "DESK", "certificate", TAGS_DTO[0].getName());

        assertEquals(certificatesDto, actual);
    }
}