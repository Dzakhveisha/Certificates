package com.epam.esm.service.exception;

public class EntityNotFoundException extends RuntimeException {
    public static final String CODE = "-01";
    private static final String MSG_NOT_FOUND = "%s with id %d is not found!";

    public EntityNotFoundException(Long id) {
        super(String.format(MSG_NOT_FOUND, "entity", id));
    }

    public EntityNotFoundException(String entityType, Long id) {
        super(String.format(MSG_NOT_FOUND, entityType, id));
    }

}
