package com.epam.esm.dao.model;

import com.epam.esm.dao.audit.AuditListener;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "certificate_tag")
@Data
@EqualsAndHashCode
@EntityListeners(AuditListener.class)
@AllArgsConstructor
@NoArgsConstructor
public class CertificateToTagRelation {

    @EmbeddedId
    private CertificateToTagRelationId id;

    @ManyToOne
    @MapsId("certificateId")
    @JoinColumn(name = "certificate_id")
    private Certificate certificate;

    @ManyToOne
    @MapsId("tagId")
    @JoinColumn(name = "tag_id")
    private Tag tag;

    public CertificateToTagRelation(Certificate certificate, Tag newTag) {
        this.certificate = certificate;
        this.tag = newTag;
        this.id = new CertificateToTagRelationId(certificate.getId(), tag.getId());
    }
}
