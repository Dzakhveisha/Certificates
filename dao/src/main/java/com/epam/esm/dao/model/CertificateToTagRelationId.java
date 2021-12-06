package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Data
@Embeddable
@AllArgsConstructor
@NoArgsConstructor
public class CertificateToTagRelationId implements Serializable {

    @Column(name = "certificate_id")
    private Long certificateId;

    @Column(name = "tag_id")
    private Long tagId;
}
