package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "certificates")
@Data
@Builder
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class Certificate extends BaseEntity {

    @Column
    private String name;

    @Column
    private String description;

    @Column
    private Long price;

    @Column
    private Integer duration;

    @Column(name = "create_date")
    private LocalDateTime createDate;

    @Column(name = "last_update_date")
    private LocalDateTime lastUpdateDate;

    @ToString.Exclude
    @OneToMany(mappedBy = "certificate", cascade = {CascadeType.MERGE})
    private List<CertificateToTagRelation> certificateToTagRelationList;

    public Certificate(long id, String name, String description, Long price, Integer duration, LocalDateTime createDate, LocalDateTime lastUpdateDate) {
        super(id);
        this.name = name;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
    }
}
