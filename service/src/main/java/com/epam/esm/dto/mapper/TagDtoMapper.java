package com.epam.esm.dto.mapper;


import com.epam.esm.dto.TagDto;
import com.epam.esm.model.Tag;
import org.springframework.stereotype.Component;

@Component
public class TagDtoMapper {

    public Tag toEntity(TagDto tagDTO) {
        if (tagDTO == null){
            return null;
        }
        return new Tag(tagDTO.getId(), tagDTO.getName());
    }

    public TagDto toDTO(Tag tag) {
        if (tag == null){
            return null;
        }
        return new TagDto(tag.getId(), tag.getName());
    }

}

