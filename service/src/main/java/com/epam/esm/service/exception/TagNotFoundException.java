package com.epam.esm.service.exception;

public class TagNotFoundException extends RuntimeException {

    public static final String CODE = "-02";
    private static final String MSG_TAG_NOT_FOUND = "Tag with id %d is not found!";

    public TagNotFoundException(Long id) {
        super(String.format(MSG_TAG_NOT_FOUND, id));
    }
}
