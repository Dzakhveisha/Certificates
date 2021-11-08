package com.epam.esm.dto.mapper;


import com.epam.esm.dto.TagDto;
import com.epam.esm.model.Tag;
import org.springframework.stereotype.Component;

@Component
public class TagDtoMapper {

    public Tag toEntity(TagDto tagDTO) {
        return new Tag(tagDTO.getId(), tagDTO.getName());
    }

    public TagDto toDTO(Tag tag) {
        return new TagDto(tag.getId(), tag.getName());
    }

}

