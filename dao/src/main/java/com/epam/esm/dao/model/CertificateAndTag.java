package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "certificate_tag")
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
