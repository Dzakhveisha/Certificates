package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.jpa.OrderDao;
import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.CertificateDtoMapper;
import com.epam.esm.service.mapper.TagDtoMapper;
import com.epam.esm.service.model.dto.CertificateDto;
import com.epam.esm.service.model.dto.TagDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith({MockitoExtension.class})
class CertificateServiceImplTest {

    private CertificateServiceImpl certificateService;
    @Mock
    private CertificateDao certificateDao;
    @Mock
    private CertificateAndTagDao certificateAndTagDao;
    @Mock
    private TagDao tagDao;
    @Mock
    private OrderDao orderDao;

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
        certificateService = new CertificateServiceImpl(certificateDao, tagDao, certificateAndTagDao, orderDao,
                new CertificateDtoMapper(), new TagDtoMapper());
    }

    @Test
    void findByIdShouldReturnCertificateWithSuchId() {
        CertificateDto certificateDto = CERTIFICATES_DTO[1];
        Certificate certificate = CERTIFICATES[1];

        Mockito.when(certificateDao.getById(2L)).thenReturn(Optional.of(certificate));
        Mockito.when(certificateAndTagDao.listOfTagsByCertificate(certificateDto.getId())).thenReturn(Arrays.asList(TAGS[0]));

        CertificateDto actual = certificateService.findById(2L);
        assertEquals(certificateDto, actual);
    }

    @Test
    void testFindByIdShouldThrowEntityNotFoundException() {
        Mockito.when(certificateDao.getById(199L)).thenReturn(Optional.empty());
        assertThrows(EntityNotFoundException.class, () -> certificateService.findById(199L));
    }

    @Test
    void testFindAllShouldReturnAllCertificatesFromDb() {
        CertificateDto firstCertificate = CERTIFICATES_DTO[0];
        CertificateDto secondCertificate = CERTIFICATES_DTO[1];
        List<Certificate> certificatesEntities = Arrays.asList(CERTIFICATES[0], CERTIFICATES[1]);

        Mockito.when(certificateAndTagDao.listOfTagsByCertificate(firstCertificate.getId())).thenReturn(Arrays.asList(TAGS[0]));
        Mockito.when(certificateAndTagDao.listOfTagsByCertificate(secondCertificate.getId())).thenReturn(Arrays.asList(TAGS[0]));
        Mockito.when(certificateDao.listOf(1)).thenReturn(new PageOfEntities<>(1, 1, certificatesEntities));

        PageOfEntities<CertificateDto> actual = certificateService.findAll(1);
        List<CertificateDto> actualList = actual.getCurPage();

        List<CertificateDto> certificatesDto = Arrays.asList(firstCertificate, secondCertificate);
        assertEquals(certificatesDto, actualList);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<Certificate> certificates = Collections.emptyList();

        Mockito.when(certificateDao.listOf(1)).thenReturn(new PageOfEntities<Certificate>(1, 1, certificates));
        PageOfEntities<CertificateDto> actual = certificateService.findAll(1);
        List<CertificateDto> actualList = actual.getCurPage();

        List<CertificateDto> certificatesDto = Collections.emptyList();
        assertEquals(certificatesDto, actualList);
    }

    @Test
    void testCreateShouldReturnNewCertificate() {
        CertificateDto certificateDto = CERTIFICATES_DTO[0];
        Certificate newCertificate = CERTIFICATES[0];

        Mockito.when(certificateDao.create(Mockito.any())).thenReturn(newCertificate);
        Mockito.when(tagDao.getByName(TAGS[0].getName())).thenReturn(Optional.of(TAGS[0]));
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

        Mockito.when(tagDao.getByName(tagDto.getName())).thenReturn(Optional.of(tag));
        Mockito.when(certificateDao.update(Mockito.eq(certificateForUpdateDto.getId()), Mockito.any()))
                .thenReturn(Optional.of(updatingCertificate));

        CertificateDto actual = certificateService.update(certificateForUpdateDto.getId(), certificateForUpdateDto);

        assertEquals(updatingCertificateDto.getName(), actual.getName());
    }

    @Test
    void testUpdateShouldThrowCertificateNotFoundExceptionIfItIsNotExistInDb() {
        CertificateDto certificateForUpdateDto = new CertificateDto(222L, "certificateUP", "up", null,
                null, null, "2021-11-06 11:00:00", Collections.emptyList());

        Mockito.when(certificateDao.update(Mockito.eq(222L), Mockito.any())).thenReturn(Optional.empty());

        assertThrows(EntityNotFoundException.class, () -> certificateService.update(222L, certificateForUpdateDto));
    }

    @Test
    void testRemove() {
        CertificateDto certificateDto = CERTIFICATES_DTO[2];
        Certificate certificate = CERTIFICATES[2];

        Mockito.when(certificateDao.remove(certificateDto.getId())).thenReturn(true);
        Mockito.when(certificateDao.getById(certificateDto.getId())).thenReturn(Optional.of(certificate));
        Mockito.when(certificateAndTagDao.listOfTagsByCertificate(certificateDto.getId()))
                .thenReturn(new ArrayList<>(Arrays.asList(TAGS[1], TAGS[2])));

        certificateService.remove(certificateDto.getId());

        TagDto firstTag = TAGS_DTO[1];
        TagDto secondTag = TAGS_DTO[2];
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).remove(firstTag.getId(), certificateDto.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).remove(secondTag.getId(), certificateDto.getId());
    }

    @Test
    void testSortAllWithCriteria() {
        List<Certificate> certificates = new ArrayList<>(Arrays.asList(CERTIFICATES[1], CERTIFICATES[0]));

        Mockito.when(certificateDao.sortListWithCriteria(new Criteria("name", "DESK", "certificate",
                new HashSet<>(Arrays.asList(TAGS_DTO[0].getName()))), 1)).thenReturn(new PageOfEntities<>(1, 1, certificates));
        Mockito.when(certificateAndTagDao.listOfTagsByCertificate(certificates.get(0).getId())).thenReturn(Arrays.asList(TAGS[0]));
        Mockito.when(certificateAndTagDao.listOfTagsByCertificate(certificates.get(1).getId())).thenReturn(Arrays.asList(TAGS[0]));

        PageOfEntities<CertificateDto> actualPage = certificateService.sortAllWithCriteria(new Criteria("name", "DESK", "certificate",
                new HashSet<>(Arrays.asList(TAGS_DTO[0].getName()))), 1);
        List<CertificateDto> actual = actualPage.getCurPage();

        List<CertificateDto> certificatesDto = new ArrayList<>(Arrays.asList(CERTIFICATES_DTO[1], CERTIFICATES_DTO[0]));
        assertEquals(certificatesDto, actual);
    }
}