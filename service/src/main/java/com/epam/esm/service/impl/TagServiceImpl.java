package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagRelatonRepository;
import com.epam.esm.dao.jpa.TagRepository;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.TagService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.exception.EntityAlreadyExistException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.TagDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TagServiceImpl implements TagService {

    private final TagRepository tagRepository;
    private final CertificateAndTagRelatonRepository certificateAndTagRepository;
    private final Mapper<Tag, TagDto> dtoMapper;

    @Override
    public TagDto findById(Long id) {
        return tagRepository.findById(id)
                .map(dtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Tag", id));
    }

    @Override
    public Page<TagDto> findAll(int pageNumber) {
        Page<Tag> page = tagRepository.findAll(PageRequest.of(pageNumber - 1, 10));
        return page.map(dtoMapper::toDTO);
    }

    @Transactional
    @Override
    public TagDto create(TagDto entity) {
        if (!tagRepository.findByName(entity.getName()).isPresent()) {
            return dtoMapper.toDTO(tagRepository
                    .save(dtoMapper.toEntity(entity)));
        }
        throw new EntityAlreadyExistException(entity.getName(), "Tag");
    }

    @Transactional
    @Override
    public void remove(Long id) {
        if (!tagRepository.findById(id).isPresent()){
            throw new EntityNotFoundException("Tag", id);
        }
        final List<Certificate> certificateIds = certificateAndTagRepository.findCertificatesByTagId(id);
        certificateIds.forEach((certificate) -> certificateAndTagRepository.deleteByTagIdAndCertificateId(id, certificate.getId()));
        tagRepository.deleteById(id);
    }

    @Override
    public TagDto findMostUsefulTagByMostActiveUser() {
        return tagRepository.findMostUseful()
                .map(dtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Tag"));
    }
}
