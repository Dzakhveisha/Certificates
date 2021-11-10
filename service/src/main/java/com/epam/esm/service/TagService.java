package com.epam.esm.service;

import com.epam.esm.service.model.dto.TagDto;

import java.util.List;

public interface TagService {

    /**
     * Find tag by it's name
     *
     * @param id id of tag
     * @return founded tag
     */
    TagDto findById(Long id);

    /**
     * Find all tags
     *
     * @return list of tags
     */
    List<TagDto> findAll();

    /**
     * Create tag
     *
     * @param entity tag to create
     * @return created entity
     */
    TagDto create(TagDto entity);

    /**
     * Remove tag with such id
     *
     * @param id tag's id
     */
    void remove(Long id);
}

