package com.epam.esm.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CertificateDto {
    private Long id;

    private String name;

    private String description;

    @PositiveOrZero
    private Long price;

    @Positive
    private Integer duration;

    private String createDate;

    private String lastUpdateDate;

    private List<TagDto> tags;

    public void addTag(TagDto tag) {
        tags.add(tag);
    }
}
