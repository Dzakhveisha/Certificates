package com.epam.esm.service.mapper;

/**
 * Map entities to DTO entities
 *
 * @param <T> entity
 * @param <D> DTO entity
 */
public interface Mapper<T, D> {
    /**
     * @param dtoEntity DTO entity to map
     * @return entity
     */
    T toEntity(D dtoEntity);

    /**
     * @param entity entity to map
     * @return DTO entity
     */
    D toDTO(T entity);

}
