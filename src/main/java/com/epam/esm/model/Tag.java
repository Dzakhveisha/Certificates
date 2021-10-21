package com.epam.esm.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Data
@EqualsAndHashCode(callSuper = true)
@Component
@Scope("prototype")
public class Tag extends BaseEntity{
    private String name;

    public Tag(Long id, String name) {
        super(id);
        this.name = name;
    }
}
