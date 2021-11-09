package com.epam.esm.service.exception;

public class SuchTagAlreadyExistException extends RuntimeException {
    private static final String MESSAGE = "Tag with name %s already exist!";
    public static final String code = "-03";

    public SuchTagAlreadyExistException(String name) {
        super(String.format(MESSAGE, name));
    }
}
