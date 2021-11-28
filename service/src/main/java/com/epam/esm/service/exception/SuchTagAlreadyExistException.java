package com.epam.esm.service.exception;

public class SuchTagAlreadyExistException extends RuntimeException {

    public static final String CODE = "-03";
    private static final String MESSAGE = "Tag with name %s already exist!";

    public SuchTagAlreadyExistException(String name) {
        super(String.format(MESSAGE, name));
    }
}
