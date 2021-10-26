package com.epam.esm.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;

@Data
@EqualsAndHashCode(callSuper = true)
@Component
@Scope("prototype")
@NoArgsConstructor
public class Tag extends BaseEntity {

    @NotNull
    private String name;

    public Tag(Long id, String name) {
        super(id);
        this.name = name;
    }
}
