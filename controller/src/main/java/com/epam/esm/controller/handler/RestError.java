package com.epam.esm.controller.handler;

import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
public class RestError {
    private final String errorMessage;
    private final String errorCode;

    public RestError(String errorMessage, HttpStatus httpStatus, String exceptionCode) {
        this.errorMessage = errorMessage;
        this.errorCode = httpStatus.value() + exceptionCode;
    }

    public RestError(String errorMessage, HttpStatus httpStatus) {
        this.errorMessage = errorMessage;
        this.errorCode = String.valueOf(httpStatus.value());
    }
}
