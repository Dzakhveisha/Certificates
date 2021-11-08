package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class Certificate extends BaseEntity {

    private String name;

    private String description;

    private Long price;

    private Integer duration;

    private LocalDateTime createDate;

    private LocalDateTime lastUpdateDate;


    public Certificate(Long id, String name, String description, Long price, Integer duration, LocalDateTime createDate, LocalDateTime lastUpdateDate) {
        super(id);
        this.name = name;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
    }
}
