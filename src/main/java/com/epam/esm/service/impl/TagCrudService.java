package com.epam.esm.service.impl;

import com.epam.esm.dao.BaseDao;
import com.epam.esm.exceptions.TagNotFoundException;
import com.epam.esm.model.Tag;
import com.epam.esm.service.CrudService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TagCrudService implements CrudService<Tag> {

    private final BaseDao<Tag> jdbcTagDao;

    @Override
    public Tag findById(Long id) throws TagNotFoundException {
        return jdbcTagDao.getEntityById(id).orElseThrow(() -> new TagNotFoundException(id));
    }

    @Override
    public List<Tag> findAll() {
        return jdbcTagDao.listOfEntities();
    }

    @Override
    public void create(Tag entity) {
        jdbcTagDao.createEntity(entity);
    }

    @Override
    public Tag update(Tag entity) {
        return null;
    }

    @Override
    public boolean remove(Long id) {
        return jdbcTagDao.removeEntity(id);
    }
}
