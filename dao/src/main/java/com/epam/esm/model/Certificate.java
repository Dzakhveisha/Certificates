package com.epam.esm.model;

import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class Certificate extends BaseEntity {

    @NotNull
    private String name;

    @NotNull
    private String description;

    @NotNull
    @PositiveOrZero
    private Long price;

    @NotNull
    @Positive
    private Integer duration;

    private LocalDateTime createDate;

    private LocalDateTime lastUpdateDate;

    private List<Tag> tags;

    public Certificate(Long id, @NotNull String name, @NotNull String description, @NotNull @PositiveOrZero Long price, @NotNull @Positive Integer duration, LocalDateTime createDate, LocalDateTime lastUpdateDate, List<Tag> tags) {
        super(id);
        this.name = name;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
        this.tags = tags;
    }

    public void addTag(Tag tag) {
        tags.add(tag);
    }

}
