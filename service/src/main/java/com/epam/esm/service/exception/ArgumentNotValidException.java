package com.epam.esm.service.exception;

public class ArgumentNotValidException extends RuntimeException {

    public static final String CODE = "-04";
    private static final String MESSAGE = "Arguments are not valid: %s";

    public ArgumentNotValidException(String argument) {
        super(String.format(MESSAGE, argument));
    }
}
