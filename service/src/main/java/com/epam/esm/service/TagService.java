package com.epam.esm.service;

import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.model.dto.TagDto;

public interface TagService {

    /**
     * Find tag by it's name
     *
     * @param id id of tag
     * @return founded tag
     */
    TagDto findById(Long id);

    /**
     * Find page of all tags
     *
     * @param pageNumber number of page
     * @return page of tags
     */
    PageOfEntities<TagDto> findAll(int pageNumber);

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

    /**
     * Find the most widely used tag of a user with the highest cost of all orders
     *
     * @return the most useful tag
     */
    TagDto getMostUsefulTagByMostActiveUser();
}

