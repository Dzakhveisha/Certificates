package com.epam.esm.service.exception;

public class OrderNotFoundException extends RuntimeException {
    public static final String CODE = "-07";
    private static final String MSG_TAG_NOT_FOUND = "Order with id %d is not found!";

    public OrderNotFoundException(Long id) {
        super(String.format(MSG_TAG_NOT_FOUND, id));
    }
}
