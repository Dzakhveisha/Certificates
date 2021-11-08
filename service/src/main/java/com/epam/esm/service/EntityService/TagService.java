package com.epam.esm.service.EntityService;

import com.epam.esm.service.exception.TagNotFoundException;
import com.epam.esm.service.model.dto.TagDto;

import java.util.List;

    public interface TagService {

        TagDto findById(Long id) throws TagNotFoundException;

        List<TagDto> findAll();

        TagDto create(TagDto entity);

        void remove(Long id);
    }

