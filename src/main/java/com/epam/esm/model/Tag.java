package com.epam.esm.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class Tag extends BaseEntity {

    @NotNull
    @NotEmpty
    private String name;

    public Tag(Long id, @NotNull @NotEmpty String name) {
        super(id);
        this.name = name;
    }
}
