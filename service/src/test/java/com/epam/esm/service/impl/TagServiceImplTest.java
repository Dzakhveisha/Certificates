package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.dto.CertificateDto;
import com.epam.esm.dto.TagDto;
import com.epam.esm.dto.mapper.CertificateDtoMapper;
import com.epam.esm.dto.mapper.TagDtoMapper;
import com.epam.esm.exception.TagNotFoundException;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.*;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith({MockitoExtension.class})
class TagServiceImplTest {

    @InjectMocks
    private TagServiceImpl tagService;
    @Mock
    private JdbcTagDaoImpl tagDao;
    @Mock
    private JdbcCertificateAndTagDaoImpl certificateAndTagDao;

    private TagDtoMapper tagDtoMapper;

    @BeforeEach
    void before(){
        tagDtoMapper = new TagDtoMapper();
        tagService = new TagServiceImpl(tagDao,certificateAndTagDao, tagDtoMapper);

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
    void testFindByIdShouldReturnTagWithSuchId() {
        TagDto tag = TAGS[0];
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.of(tagDtoMapper.toEntity(tag)));
        TagDto actual = tagService.findById(1L);

        assertEquals(tag, actual);
    }

    @Test
    void testFindByIdShouldThrowTagNotFoundException() {
        Mockito.when(tagDao.getEntityById(199L)).thenReturn(Optional.empty());
        assertThrows(TagNotFoundException.class, () -> tagService.findById(199L));
    }

    @Test
    void testFindAllShouldReturnAllTagsIfDbIsNotEmpty() {
        List<TagDto> tags = Arrays.asList(TAGS[0], TAGS[1]);

        Mockito.when(tagDao.listOfEntities()).thenReturn(tags.stream().map(tagDtoMapper::toEntity).collect(Collectors.toList()));
        List<TagDto> actual = tagService.findAll();

        assertEquals(tags, actual);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<TagDto> tags = Collections.emptyList();

        Mockito.when(tagDao.listOfEntities()).thenReturn(tags.stream().map(tagDtoMapper::toEntity).collect(Collectors.toList()));
        List<TagDto> actual = tagService.findAll();

        assertEquals(tags, actual);
    }

    @Test
    void testCreateShouldReturnNewTag() {
        TagDto tag = new TagDto(null, TAGS[0].getName());
        TagDto newTagInDb = TAGS[0];

        Mockito.when(tagDao.createEntity(tagDtoMapper.toEntity(tag))).thenReturn(tagDtoMapper.toEntity(newTagInDb));
        TagDto actual = tagService.create(tag);

        assertEquals(newTagInDb, actual);
    }

    @Test
    void testRemove() {
        TagDto tag = TAGS[0];
        CertificateDto firstCertificate = CERTIFICATES[0];
        CertificateDto secondCertificate = CERTIFICATES[1];

        Mockito.when(certificateAndTagDao.listOfCertificatesIdByTags(tag.getId()))
                .thenReturn(Arrays.asList(firstCertificate.getId(), secondCertificate.getId()));

        tagService.remove(tag.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag.getId(), firstCertificate.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag.getId(), secondCertificate.getId());
    }
}