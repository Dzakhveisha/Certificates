package com.epam.esm.service.exception;

public class UserNotFoundException extends RuntimeException {
    public static final String CODE = "-06";
    private static final String MSG_TAG_NOT_FOUND = "User with id %d is not found!";

    public UserNotFoundException(Long id) {
        super(String.format(MSG_TAG_NOT_FOUND, id));
    }
}
