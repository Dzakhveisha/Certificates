package com.epam.esm.controller.handler;

import com.epam.esm.controller.config.Translator;
import com.epam.esm.service.exception.ArgumentNotValidException;
import com.epam.esm.service.exception.EntityAlreadyExistException;
import com.epam.esm.service.exception.EntityNotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@RestControllerAdvice
@AllArgsConstructor
public class RestExceptionHandler {

    private Translator translator;

    @ExceptionHandler(ArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError handleArgumentNotValidException(ArgumentNotValidException e) {
        return new RestError(translator.toLocale(HttpStatus.BAD_REQUEST.value() + ArgumentNotValidException.CODE,
                e.getCauseMsg()), HttpStatus.BAD_REQUEST, ArgumentNotValidException.CODE);
    }

    @ExceptionHandler(EntityAlreadyExistException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError HandleAlreadyExistException(EntityAlreadyExistException e) {
        return new RestError(translator.toLocale(HttpStatus.BAD_REQUEST.value() + EntityAlreadyExistException.CODE,
                e.getEntityType(), e.getName()), HttpStatus.BAD_REQUEST, EntityAlreadyExistException.CODE);
    }

    @ExceptionHandler({EntityNotFoundException.class})
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public RestError HandleTagNotFoundException(EntityNotFoundException e) {
        return new RestError(translator.toLocale(HttpStatus.NOT_FOUND.value() + EntityNotFoundException.CODE,
                e.getEntity(), e.getEntityId()), HttpStatus.NOT_FOUND, EntityNotFoundException.CODE);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        return new RestError(translator.toLocale(HttpStatus.BAD_REQUEST.value() + "-00")
                , HttpStatus.BAD_REQUEST, "-00");
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public RestError handleMethodArgumentTypeMismatchException(MethodArgumentTypeMismatchException e) {
        return new RestError(translator.toLocale(HttpStatus.BAD_REQUEST.value() + "-illegalNumber")
                , HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    public RestError handleMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        String method = e.getMethod();
        return new RestError(translator.toLocale(HttpStatus.METHOD_NOT_ALLOWED.value() + "-illegalMethod", method),
                HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public RestError handleAccessDeniedException(AccessDeniedException e){
        throw e;
    }

    @ExceptionHandler
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public RestError HandleRuntimeExceptions(RuntimeException restException) {
        return new RestError(restException.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
