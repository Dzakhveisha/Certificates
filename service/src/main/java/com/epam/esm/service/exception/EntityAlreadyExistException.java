package com.epam.esm.service.exception;

import lombok.Data;

@Data
public class EntityAlreadyExistException extends RuntimeException {

    public static final String CODE = "-03";
    private String name;
    private String entityType;

    public EntityAlreadyExistException(String name, String entityType) {
        super();
        this.name = name;
        this.entityType = entityType;
    }
}
