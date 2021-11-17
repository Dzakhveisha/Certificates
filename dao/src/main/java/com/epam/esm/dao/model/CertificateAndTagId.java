package com.epam.esm.dao.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class CertificateAndTagId implements Serializable {

    private Long certificateId;
    private Long tagId;
}
