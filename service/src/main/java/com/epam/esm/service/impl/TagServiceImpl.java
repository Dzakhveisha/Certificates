package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.TagService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.exception.EntityAlreadyExistException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.TagDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TagServiceImpl implements TagService {

    private final TagDao tagDao;
    private final CertificateAndTagDao certificateAndTagDao;
    private final Mapper<Tag, TagDto> dtoMapper;

    @Override
    public TagDto findById(Long id) {
        return tagDao.findById(id)
                .map(dtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Tag", id));
    }

    @Override
    public PageOfEntities<TagDto> findAll(int pageNumber) {
        PageOfEntities<Tag> page = tagDao.findAll(pageNumber);
        List<TagDto> tagsDto = page.getPage()
                .stream()
                .map(dtoMapper::toDTO)
                .collect(Collectors.toList());
        return new PageOfEntities<>(page.getCountOfPages(), page.getPageNumber(), tagsDto);
    }

    @Transactional
    @Override
    public TagDto create(TagDto entity) {
        if (!tagDao.findByName(entity.getName()).isPresent()) {
            return dtoMapper.toDTO(tagDao
                    .create(dtoMapper.toEntity(entity)));
        }
        throw new EntityAlreadyExistException(entity.getName(), "Tag");
    }

    @Transactional
    @Override
    public void remove(Long id) {
        final List<Certificate> certificateIds = certificateAndTagDao.findCertificatesByTags(id);
        certificateIds.forEach((certificate) -> certificateAndTagDao.remove(id, certificate.getId()));
        if (!tagDao.remove(id)) {
            throw new EntityNotFoundException("Tag", id);
        }
    }

    @Override
    public TagDto findMostUsefulTagByMostActiveUser() {
        return tagDao.findMostUsefulByMostActiveUser()
                .map(dtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Tag"));
    }
}
