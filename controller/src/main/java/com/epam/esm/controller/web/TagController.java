package com.epam.esm.controller.web;

import com.epam.esm.service.model.dto.TagDto;
import com.epam.esm.service.EntityService.TagService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/tags")
@Validated
public class TagController {

    private final TagService tagService;

    @GetMapping
    public List<TagDto> getAllTags() {
        return tagService.findAll();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public TagDto createTag(@Valid @RequestBody TagDto tag) {
        return tagService.create(tag);
    }

    @GetMapping("/{id}")
    public TagDto getTag(@PathVariable Long id) {
        return tagService.findById(id);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTag(@PathVariable Long id) {
        tagService.remove(id);
    }
}