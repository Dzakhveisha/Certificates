package com.epam.esm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
public class TagDto {
    private Long id;
    @NotNull
    @NotEmpty
    private String name;
}
