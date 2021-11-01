package com.epam.esm.service.exception;

public class CertificateNotFoundException extends EntityNotFoundException {
    private static final String MSG_CERTIFICATE_NOT_FOUND = "Certificate with id %d is not found!";

    public CertificateNotFoundException(Long id) {
        super(String.format(MSG_CERTIFICATE_NOT_FOUND, id));
    }
}
