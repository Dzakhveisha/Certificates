package com.epam.esm.service.exception;

public class TagNotFoundException extends RuntimeException {

    private static final String MSG_TAG_NOT_FOUND = "Tag with id %d is not found!";
    public static final String code = "-02";

    public TagNotFoundException(Long id) {
        super(String.format(MSG_TAG_NOT_FOUND, id));
    }
}
