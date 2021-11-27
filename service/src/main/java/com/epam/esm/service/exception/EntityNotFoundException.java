package com.epam.esm.service.exception;

import lombok.Data;

@Data
public class EntityNotFoundException extends RuntimeException {
    public static final String CODE = "-01";

    private String entity;
    private Long entityId;

    public EntityNotFoundException(String entityType, Long id) {
        super();
        this.entity = entityType;
        this.entityId = id;
    }

    public EntityNotFoundException(String entityType) {
        super();
        this.entity = entityType;
        this.entityId = 0L;
    }
}
