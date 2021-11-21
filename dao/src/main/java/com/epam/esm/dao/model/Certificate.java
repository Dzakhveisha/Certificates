package com.epam.esm.dao.model;

import lombok.*;

import javax.persistence.*;
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

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private Long price;

    @Column(name = "duration")
    private Integer duration;

    @Column(name = "create_date")
    private LocalDateTime createDate;

    @Column(name = "last_update_date")
    private LocalDateTime lastUpdateDate;

    @OneToMany(mappedBy = "certificate")
    private List<CertificateAndTag> certificateAndTagList;

    @OneToMany(mappedBy = "certificate")
    List<Order> orders;
}
