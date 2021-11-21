package com.epam.esm.service.exception;

public class OrderNotBelongToUser extends RuntimeException{
    public static final String CODE = "-08";
    private static final String MSG_TAG_NOT_FOUND = "Order is not belong to this user!";

    public OrderNotBelongToUser() {
        super(MSG_TAG_NOT_FOUND);
    }
}
