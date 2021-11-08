package com.epam.esm.handler;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolationException;

@RestControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError handleConstraintViolationException(MethodArgumentNotValidException e) {
        return new RestError("Not enough arguments or arguments are not valid!", HttpStatus.BAD_REQUEST.value());
    }

    @ExceptionHandler
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public RestError HandleRestExceptions(RuntimeException restException) {
        return new RestError(restException.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR.value());
    }

    @Data
    @AllArgsConstructor
    protected class RestError {
        private String errorMessage;
        private Integer errorCode;
    }

}
