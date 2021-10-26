package com.epam.esm.dao;

import com.epam.esm.model.BaseEntity;

import java.util.List;
import java.util.Optional;

public interface BaseDao<T extends BaseEntity> {

    void createEntity(T entity);

    Optional<T> getEntityById(Long id);

    List<T> listOfEntities();

    boolean removeEntity(Long id);

    void updateEntity(Long id, T newEntity);
}
