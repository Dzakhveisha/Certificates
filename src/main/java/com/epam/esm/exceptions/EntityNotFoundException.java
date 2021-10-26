package com.epam.esm.exceptions;

public class EntityNotFoundException extends Exception {
    public EntityNotFoundException() {
    }

    public EntityNotFoundException(String message) {
        super(message);
    }
}
