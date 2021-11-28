package com.epam.esm.service.impl;

import com.epam.esm.dao.jdbc.CertificateAndTagDao;
import com.epam.esm.dao.jdbc.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.exception.TagNotFoundException;
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
class TagServiceImplTest {

    @InjectMocks
    private TagServiceImpl tagService;
    @Mock
    private TagDao tagDao;
    @Mock
    private CertificateAndTagDao certificateAndTagDao;

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
        tagService = new TagServiceImpl(tagDao, certificateAndTagDao, new TagDtoMapper());
    }

    @Test
    void testFindByIdShouldReturnTagWithSuchId() {
        TagDto tagDto = TAGS_DTO[0];
        Tag tag = TAGS[0];
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.of(tag));
        TagDto actual = tagService.findById(1L);

        assertEquals(tagDto, actual);
    }

    @Test
    void testFindByIdShouldThrowTagNotFoundException() {
        Mockito.when(tagDao.getEntityById(199L)).thenReturn(Optional.empty());
        assertThrows(TagNotFoundException.class, () -> tagService.findById(199L));
    }

    @Test
    void testFindAllShouldReturnAllTagsIfDbIsNotEmpty() {
        List<TagDto> tagsDto = Arrays.asList(TAGS_DTO[0], TAGS_DTO[1]);
        List<Tag> tags = Arrays.asList(TAGS[0], TAGS[1]);

        Mockito.when(tagDao.listOfEntities()).thenReturn(tags);
        List<TagDto> actual = tagService.findAll();

        assertEquals(tagsDto, actual);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<Tag> tagsDto = Collections.emptyList();
        List<Tag> tags = Collections.emptyList();

        Mockito.when(tagDao.listOfEntities()).thenReturn(tags);
        List<TagDto> actual = tagService.findAll();

        assertEquals(tagsDto, actual);
    }

    @Test
    void testCreateShouldReturnNewTag() {
        TagDto tagDto = TAGS_DTO[0];
        Tag tag = TAGS[0];

        Mockito.when(tagDao.createEntity(tag)).thenReturn(tag);
        TagDto actual = tagService.create(tagDto);

        assertEquals(tagDto, actual);
    }

    @Test
    void testRemove() {
        TagDto tag = TAGS_DTO[0];
        CertificateDto firstCertificate = CERTIFICATES_DTO[0];
        CertificateDto secondCertificate = CERTIFICATES_DTO[1];

        Mockito.when(tagDao.removeEntity(tag.getId())).thenReturn(true);
        Mockito.when(certificateAndTagDao.listOfCertificatesIdByTags(tag.getId()))
                .thenReturn(Arrays.asList(firstCertificate.getId(), secondCertificate.getId()));

        tagService.remove(tag.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag.getId(), firstCertificate.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag.getId(), secondCertificate.getId());
    }
}