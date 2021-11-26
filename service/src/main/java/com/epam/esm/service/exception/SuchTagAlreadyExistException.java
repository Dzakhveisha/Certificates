package com.epam.esm.service.exception;

import lombok.Data;

@Data
public class SuchTagAlreadyExistException extends RuntimeException {

    public static final String CODE = "-03";
    private String tagName;

    public SuchTagAlreadyExistException(String name) {
        super();
        this.tagName = name;
    }
}
