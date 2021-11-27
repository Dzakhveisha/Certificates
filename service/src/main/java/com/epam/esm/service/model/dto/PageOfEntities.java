package com.epam.esm.service.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageOfEntities<T> {

    private Integer countOfPages;

    private List<T> curPage;

}
