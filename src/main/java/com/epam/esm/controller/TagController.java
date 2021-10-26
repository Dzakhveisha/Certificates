package com.epam.esm.controller;

import com.epam.esm.exceptions.TagNotFoundException;
import com.epam.esm.model.Tag;
import com.epam.esm.service.impl.TagCrudService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/tags")
public class TagController {

    private final TagCrudService tagService;

    @GetMapping
    public List<Tag> getAllTags() {
        return tagService.findAll();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public void createTag(@Valid @RequestBody Tag tag){
        tagService.create(tag);
    }

    @GetMapping("/{id}")
    public Tag getTag(@PathVariable Long id){
        try {
            return tagService.findById(id);
        } catch (TagNotFoundException e) {
            return null;                             // ?? обработать ошибку
        }
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTag(@PathVariable Long id){
        if (tagService.remove(id)){
            // it is OK
        }
        else{
            // ошибка
        }
    }
}
