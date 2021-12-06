package com.epam.esm.service.exception;

import lombok.Data;

@Data
public class EntityAlreadyExistException extends RuntimeException {

    public static final String CODE = "-03";
    private String tagName;

    public EntityAlreadyExistException(String name) {
        super();
        this.tagName = name;
    }
}
