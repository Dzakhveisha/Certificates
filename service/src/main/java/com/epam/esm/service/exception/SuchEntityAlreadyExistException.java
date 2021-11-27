package com.epam.esm.service.exception;

import lombok.Data;

@Data
public class SuchEntityAlreadyExistException extends RuntimeException {

    public static final String CODE = "-03";
    private String tagName;

    public SuchEntityAlreadyExistException(String name) {
        super();
        this.tagName = name;
    }
}
