package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class Criteria {
    private String sortBy;
    private String order;
    private String partName;
    private List<String> tagNames;
}
