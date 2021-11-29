package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.TagService;
import com.epam.esm.service.model.dto.TagDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.constraints.Min;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/tags")
@Validated
public class TagController {

    private final TagService tagService;
    private final Linker<TagDto> tagDtoLinker;

    @GetMapping
    public PageOfEntities<TagDto> getAllTags(@Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {
        PageOfEntities<TagDto> tagsPage = tagService.findAll(pageNumber);
        tagsPage.getCurPage().forEach(tagDtoLinker::addLinks);
        tagDtoLinker.addPaginationLinks(tagsPage);
        return tagsPage;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public TagDto createTag(@Valid @RequestBody TagDto tag) {
        TagDto createdTag = tagService.create(tag);
        tagDtoLinker.addLinks(createdTag);
        return createdTag;
    }

    @GetMapping("/{id}")
    public TagDto getTag(@PathVariable Long id) {
        TagDto tag = tagService.findById(id);
        tagDtoLinker.addLinks(tag);
        return tag;
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteTag(@PathVariable Long id) {
        tagService.remove(id);
    }

    @GetMapping("/mostUseful")
    TagDto getMostUsefulTag() {
        TagDto mostUsefulTag = tagService.getMostUsefulTagByMostActiveUser();
        tagDtoLinker.addLinks(mostUsefulTag);
        return mostUsefulTag;
    }
}
