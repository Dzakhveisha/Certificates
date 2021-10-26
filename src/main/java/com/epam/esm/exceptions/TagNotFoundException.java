package com.epam.esm.exceptions;

public class TagNotFoundException extends EntityNotFoundException {

    public TagNotFoundException(Long id) {
        super("Tag with id" + id + " is not found!");
    }
}
