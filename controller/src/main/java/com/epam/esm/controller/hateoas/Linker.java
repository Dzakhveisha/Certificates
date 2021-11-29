package com.epam.esm.controller.hateoas;

import com.epam.esm.dao.model.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import org.springframework.stereotype.Component;

@Component
public interface Linker<T> {
    /**
     * Add links to entity
     *
     * @param entity to be added links for
     */
    void addLinks(T entity);

    /**
     * add next and pred links, if it need
     *
     * @param page page
     */
    void addPaginationLinks(PageOfEntities<T> page);

    /**
     * add next and pred links for search with criteria result page, if it need
     *
     * @param page     page
     * @param criteria search criteria
     */
    default void addPaginationLinks(PageOfEntities<T> page, Criteria criteria) {
    }

}
