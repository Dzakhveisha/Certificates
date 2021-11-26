package com.epam.esm.controller.web;

import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.service.TagService;
import com.epam.esm.service.model.dto.TagDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/tags")
@Validated
public class TagController {

    private final TagService tagService;
    private final Linker<TagDto> tagDtoLinker;

    @GetMapping
    public List<TagDto> getAllTags(@Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {
        List<TagDto> tags = tagService.findAll(pageNumber);
        tags.forEach(tagDtoLinker::addLinks);
        return tags;
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
