package com.epam.esm.controller.hateoas;

import com.epam.esm.controller.web.TagController;
import com.epam.esm.service.model.dto.TagDto;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Component
public class TagDtoLinker implements Linker<TagDto> {
    @Override
    public void addLinks(TagDto tag) {
        tag.add(linkTo(methodOn(TagController.class)
                .getTag(tag.getId()))
                .withSelfRel());
    }
}
