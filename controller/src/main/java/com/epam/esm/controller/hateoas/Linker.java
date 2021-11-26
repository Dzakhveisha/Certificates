package com.epam.esm.controller.hateoas;

import org.springframework.stereotype.Component;

@Component
public interface Linker<T> {
    /**
     * Add links to entity
     *
     * @param entity to be added links for
     */
    void addLinks(T entity);
}
