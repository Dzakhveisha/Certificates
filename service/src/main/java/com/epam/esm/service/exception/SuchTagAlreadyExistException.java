package com.epam.esm.service.exception;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class SuchTagAlreadyExistException extends RuntimeException {
    private static final String MESSAGE = "Tag with name %s already exist!";
    public static final String code = "-03";

    public SuchTagAlreadyExistException(@NotNull @Size(min = 1) String name) {
        super(String.format(MESSAGE, name));
    }
}
