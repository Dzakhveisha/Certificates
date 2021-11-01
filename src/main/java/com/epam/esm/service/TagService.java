package com.epam.esm.service;

import com.epam.esm.model.Tag;
import com.epam.esm.service.exception.TagNotFoundException;

import java.util.List;

public interface TagService {

    Tag findById(Long id) throws TagNotFoundException;

    List<Tag> findAll();

    Tag create(Tag entity);

    void remove(Long id);
}
