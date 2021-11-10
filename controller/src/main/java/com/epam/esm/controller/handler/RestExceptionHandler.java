package com.epam.esm.controller.handler;

import com.epam.esm.service.exception.ArgumentNotValidException;
import com.epam.esm.service.exception.CertificateNotFoundException;
import com.epam.esm.service.exception.SuchTagAlreadyExistException;
import com.epam.esm.service.exception.TagNotFoundException;
import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@RestControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(ArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError handleArgumentNotValidException(ArgumentNotValidException e) {
        return new RestError(e.getMessage(), HttpStatus.BAD_REQUEST, ArgumentNotValidException.CODE);
    }

    @ExceptionHandler(SuchTagAlreadyExistException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError HandleAlreadyExistException(SuchTagAlreadyExistException e) {
        return new RestError(e.getMessage(), HttpStatus.BAD_REQUEST, SuchTagAlreadyExistException.CODE);
    }

    @ExceptionHandler({TagNotFoundException.class})
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public RestError HandleTagNotFoundException(TagNotFoundException e) {
        return new RestError(e.getMessage(), HttpStatus.NOT_FOUND, TagNotFoundException.CODE);
    }

    @ExceptionHandler({CertificateNotFoundException.class})
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public RestError HandleCertificateNotFoundException(CertificateNotFoundException e) {
        return new RestError(e.getMessage(), HttpStatus.NOT_FOUND, CertificateNotFoundException.CODE);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        return new RestError("Argument is not valid!", HttpStatus.BAD_REQUEST, "-00");
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError handleMethodArgumentTypeMismatchException(MethodArgumentTypeMismatchException e) {
        return new RestError("Number is illegal!", HttpStatus.BAD_REQUEST, "");
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    @ResponseBody
    public RestError handleMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        String method = e.getMethod();
        return new RestError(String.format("Method %s is not supported!", method),
                HttpStatus.BAD_REQUEST, "");

    }

    @ExceptionHandler
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public RestError HandleRuntimeExceptions(RuntimeException restException) {
        return new RestError(restException.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR, "");
    }

    @Data
    protected class RestError {
        private final String errorMessage;
        private final String errorCode;

        public RestError(String errorMessage, HttpStatus httpStatus, String exceptionCode) {
            this.errorMessage = errorMessage;
            this.errorCode = httpStatus.value() + exceptionCode;
        }
    }

}
