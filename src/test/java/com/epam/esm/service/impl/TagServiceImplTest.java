package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.model.Tag;
import com.epam.esm.service.TagService;
import com.epam.esm.service.exception.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class TagServiceImplTest {

    @InjectMocks
    private TagServiceImpl tagService;
    @Mock
    private JdbcTagDaoImpl tagDao;
    @Mock
    private JdbcCertificateAndTagDaoImpl certificateAndTagDao;

    @Test
    public void testGetByIdShouldReturnTagWhenTagInDb() {
        Tag tag = new Tag("tagName");
        tag.setId(1L);
        Mockito.when(tagDao.getEntityById(1L)).thenReturn(Optional.of(tag));
        final Tag actual = tagService.findById(1L);
        assertEquals(tag, actual);
        assertNotNull(actual);
    }

    @Test
    void findByIdShouldThrowEntityNotFoundException() {
        Mockito.when(tagDao.getEntityById(199L)).thenReturn(Optional.empty());
        assertThrows(EntityNotFoundException.class, () -> tagService.findById(199L) );
    }

    @Test
    void findAllShouldReturnAllTagsIfDbIsNotEmpty(){
        Tag tag1 = new Tag("tagName1");
        tag1.setId(1L);
        Tag tag2 = new Tag("tagName2");
        tag2.setId(1L);
        List<Tag> tags = Arrays.asList(tag1, tag2);

        Mockito.when(tagDao.listOfEntities()).thenReturn(tags);
        final List<Tag> actual = tagService.findAll();
        assertEquals(tags, actual);
        assertNotNull(actual);
    }

    @Test
    void findAllShouldReturnEmptyListIfDbIsEmpty(){
        List<Tag> tags = Collections.emptyList();

        Mockito.when(tagDao.listOfEntities()).thenReturn(tags);
        final List<Tag> actual = tagService.findAll();
        assertEquals(tags, actual);
        assertNotNull(actual);
    }

    @Test
    void createShouldReturnNewTag(){
        Tag tag = new Tag("tagName");
        Tag newTagInDb = new Tag("tagName");
        newTagInDb.setId(1L);
        Mockito.when(tagDao.createEntity(tag)).thenReturn(newTagInDb);

        final Tag actual = tagService.create(tag);
        assertEquals(newTagInDb, actual);
        assertNotNull(actual);
    }

    @Test
    void remove(){
        //?
    }

}