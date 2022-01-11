package com.epam.esm.dao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Set;

@Data
@AllArgsConstructor
public class Criteria {
    private String sortBy;
    private String order;
    private String partName;
    private Set<String> tagNames;
}
