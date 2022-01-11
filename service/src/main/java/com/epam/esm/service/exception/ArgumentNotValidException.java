package com.epam.esm.service.exception;

import lombok.Data;

@Data
public class ArgumentNotValidException extends RuntimeException {

    public static final String CODE = "-02";

    private String causeMsg;

    public ArgumentNotValidException(String argument) {
        super();
        this.causeMsg = argument;
    }
}
