package com.epam.esm.service.exception;

public class CertificateNotFoundException extends RuntimeException {

    private static final String MSG_CERTIFICATE_NOT_FOUND = "Certificate with id %d is not found!";
    public static final String code = "-01";

    public CertificateNotFoundException(Long id) {
        super(String.format(MSG_CERTIFICATE_NOT_FOUND, id));
    }
}