package com.epam.esm.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
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

    @NotNull
    private String name;

    @NotNull
    private String description;

    @NotNull
    @Min(value = 0)
    private Long price;

    @NotNull
    @Min(value = 0)
    private Integer duration;

    private String createDate;

    private String lastUpdateDate;

    private List<TagDto> tags;

    public void addTag(TagDto tag) {
        tags.add(tag);
    }
}
