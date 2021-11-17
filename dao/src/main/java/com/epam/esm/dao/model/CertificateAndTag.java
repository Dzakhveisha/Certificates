package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "certificate_tag")
@IdClass(CertificateAndTagId.class)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CertificateAndTag {
    @Id
    @Column(name = "certificate_id")
    private Long certificateId;

    @Id
    @Column(name = "tag_id")
    private Long tagId;

}
