package com.epam.esm.model;

import lombok.Data;

import java.security.cert.Certificate;

@Data
public class CertificateAndTag {
    private Certificate certificate;
    private Tag tag;

}
