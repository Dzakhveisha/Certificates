package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.TagService;
import com.epam.esm.service.model.dto.TagDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
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
@RequestMapping("/tags")
@Validated
public class TagController {

    private final TagService tagService;
    private final Linker<TagDto> tagDtoLinker;

    @GetMapping
    @PreAuthorize("permitAll()")
    public PageOfEntities<TagDto> getAllTags(@Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {
        Page<TagDto> tagsPage = tagService.findAll(pageNumber);
        tagsPage.forEach(tagDtoLinker::addLinks);
        PageOfEntities<TagDto> page = new PageOfEntities<>(tagsPage.getTotalPages(),
                tagsPage.getPageable().getPageNumber() + 1, tagsPage.getContent());
        tagDtoLinker.addPaginationLinks(page);
        return page;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("hasAuthority('ADMIN')")
    public TagDto createTag(@Valid @RequestBody TagDto tag) {
        TagDto createdTag = tagService.create(tag);
        tagDtoLinker.addLinks(createdTag);
        return createdTag;
    }

    @GetMapping("/{id}")
    @PreAuthorize("permitAll()")
    public TagDto getTag(@PathVariable Long id) {
        TagDto tag = tagService.findById(id);
        tagDtoLinker.addLinks(tag);
        return tag;
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @PreAuthorize("hasAuthority('ADMIN')")
    public void deleteTag(@PathVariable Long id) {
        tagService.remove(id);
    }

    @GetMapping("/mostUseful")
    @PreAuthorize("hasAuthority('ADMIN')")
    TagDto getMostUsefulTag() {
        TagDto mostUsefulTag = tagService.findMostUsefulTagByMostActiveUser();
        tagDtoLinker.addLinks(mostUsefulTag);
        return mostUsefulTag;
    }
}
