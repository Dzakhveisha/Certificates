package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageOfEntities<T> extends RepresentationModel<PageOfEntities<T>> {

    private Integer countOfPages;

    private Integer PageNumber;

    private List<T> Page;

}
