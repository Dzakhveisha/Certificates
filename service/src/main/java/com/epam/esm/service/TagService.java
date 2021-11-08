package com.epam.esm.service;

import com.epam.esm.dto.TagDto;
import com.epam.esm.exception.TagNotFoundException;

import java.util.List;

    public interface TagService {

        TagDto findById(Long id) throws TagNotFoundException;

        List<TagDto> findAll();

        TagDto create(TagDto entity);

        void remove(Long id);
    }

