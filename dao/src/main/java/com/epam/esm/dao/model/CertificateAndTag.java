package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CertificateAndTag {
    private Long certificateId;
    private Long tagId;

}
