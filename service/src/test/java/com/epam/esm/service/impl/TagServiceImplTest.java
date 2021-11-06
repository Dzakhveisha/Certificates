package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.model.Certificate;
import com.epam.esm.model.Tag;
import com.epam.esm.exception.TagNotFoundException;
import org.junit.jupiter.api.Assertions;
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
class TagServiceImplTest {

    @InjectMocks
    private TagServiceImpl tagService;
    @Mock
    private JdbcTagDaoImpl tagDao;
    @Mock
    private JdbcCertificateAndTagDaoImpl certificateAndTagDao;

    private static final Tag[] TAGS = {
            new Tag(1L, "tagName1"),
            new Tag(2L, "tagName2"),
            new Tag(3L, "tagName3")
    };

    private static final Certificate[] CERTIFICATES = {
            new Certificate(1L, "certificate1", "description1", 105L, 10,
                    LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Collections.singletonList(TAGS[0]))),
            new Certificate(2L, "certificate2", "description2", 108L, 10,
                    LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Collections.singletonList(TAGS[0]))),
            new Certificate(3L, "certificate3", "description3", 138L, 10,
                    LocalDateTime.now(), LocalDateTime.now(), new ArrayList<>(Arrays.asList(TAGS[1], TAGS[2])))
    };


    @Test
    void testFindByIdShouldReturnTagWithSuchId() {
        Tag tag = TAGS[0];
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.of(tag));
        final Tag actual = tagService.findById(1L);
        Assertions.assertEquals(tag, actual);
        assertNotNull(actual);
    }

    @Test
    void testFindByIdShouldThrowTagNotFoundException() {
        Mockito.when(tagDao.getEntityById(199L)).thenReturn(Optional.empty());
        assertThrows(TagNotFoundException.class, () -> tagService.findById(199L));
    }

    @Test
    void testFindAllShouldReturnAllTagsIfDbIsNotEmpty() {
        List<Tag> tags = Arrays.asList(TAGS[0], TAGS[1]);
        Mockito.when(tagDao.listOfEntities()).thenReturn(tags);
        final List<Tag> actual = tagService.findAll();
        assertEquals(tags, actual);
        assertNotNull(actual);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<Tag> tags = Collections.emptyList();
        Mockito.when(tagDao.listOfEntities()).thenReturn(tags);
        final List<Tag> actual = tagService.findAll();
        assertEquals(tags, actual);
        assertNotNull(actual);
    }

    @Test
    void testCreateShouldReturnNewTag() {
        Tag tag = new Tag(TAGS[0].getName());
        Tag newTagInDb = TAGS[0];
        Mockito.when(tagDao.createEntity(tag)).thenReturn(newTagInDb);

        final Tag actual = tagService.create(tag);
        Assertions.assertEquals(newTagInDb, actual);
        assertNotNull(actual);
    }

    @Test
    void testRemove() {
        Tag tag = TAGS[0];
        Certificate certificate1 = CERTIFICATES[0];
        Certificate certificate2 = CERTIFICATES[1];

        Mockito.when(certificateAndTagDao.listOfCertificatesIdByTags(tag.getId()))
                .thenReturn(Arrays.asList(certificate1.getId(), certificate2.getId()));

        tagService.remove(tag.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag.getId(), certificate1.getId());
        Mockito.verify(certificateAndTagDao, Mockito.times(1)).removeEntity(tag.getId(), certificate2.getId());
    }
}