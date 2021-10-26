package com.epam.esm.service;

import com.epam.esm.exceptions.TagNotFoundException;

import java.util.List;

public interface CrudService<T> {

    T findById(Long id) throws TagNotFoundException;

    List<T> findAll();

    void create(T entity);

    T update(T entity);

    boolean remove(Long id);
}
