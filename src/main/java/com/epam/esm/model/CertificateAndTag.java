package com.epam.esm.model;

import lombok.Data;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.security.cert.Certificate;

@Data
@Component
@Scope("prototype")
public class CertificateAndTag {
    private Certificate certificate;
    private Tag tag;

}
