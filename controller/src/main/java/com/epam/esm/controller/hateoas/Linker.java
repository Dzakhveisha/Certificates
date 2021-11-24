package com.epam.esm.controller.hateoas;

import org.springframework.stereotype.Component;

@Component
public interface Linker<T> {
    void addLinks(T entity);
}
