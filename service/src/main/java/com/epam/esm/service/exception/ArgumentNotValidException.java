package com.epam.esm.service.exception;

public class ArgumentNotValidException extends RuntimeException{

    private static final String MESSAGE = "Arguments are not valid: %s";
    public static final String code = "-04";

    public ArgumentNotValidException(String argument){
        super(String.format(MESSAGE, argument));
    }
}
