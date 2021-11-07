package com.epam.esm.exception;

import com.epam.esm.exception.EntityNotFoundException;


public class TagNotFoundException extends EntityNotFoundException {

    private static final String MSG_TAG_NOT_FOUND = "Tag with id %d is not found!";

    public TagNotFoundException(Long id) {
        super(String.format(MSG_TAG_NOT_FOUND, id));
    }
}
