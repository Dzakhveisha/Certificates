package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "tags")
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class Tag extends BaseEntity {

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "tag")
    List<CertificateAndTag> certificateAndTagList;

    public Tag(Long id, String name) {
        super(id);
        this.name = name;
    }
}
