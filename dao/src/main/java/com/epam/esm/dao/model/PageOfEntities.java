package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageOfEntities<T> {

    private Integer countOfPages;

    private Integer curPageNumber;

    private List<T> curPage;

}
