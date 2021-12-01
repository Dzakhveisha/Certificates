package com.epam.esm.dao.model;

import com.epam.esm.dao.audit.AuditListener;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "certificate_tag")
@Data
@EqualsAndHashCode
@EntityListeners(AuditListener.class)
@AllArgsConstructor
@NoArgsConstructor
public class CertificateAndTag {

    @EmbeddedId
    private CertificateAndTagId id;

    @ManyToOne
    @MapsId("certificateId")
    @JoinColumn(name = "certificate_id")
    private Certificate certificate;

    @ManyToOne
    @MapsId("tagId")
    @JoinColumn(name = "tag_id")
    private Tag tag;

    public CertificateAndTag(Certificate certificate, Tag newTag) {
        this.certificate = certificate;
        this.tag = newTag;
        this.id = new CertificateAndTagId(certificate.getId(), tag.getId());
    }
}
