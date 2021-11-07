package com.epam.esm.exception;

import com.epam.esm.exception.EntityNotFoundException;

public class CertificateNotFoundException extends EntityNotFoundException {

    private static final String MSG_CERTIFICATE_NOT_FOUND = "Certificate with id %d is not found!";

    public CertificateNotFoundException(Long id) {
        super(String.format(MSG_CERTIFICATE_NOT_FOUND, id));
    }
}