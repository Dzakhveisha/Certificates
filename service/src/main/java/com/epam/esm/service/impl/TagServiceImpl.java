package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.TagService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.exception.SuchTagAlreadyExistException;
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
        return tagDao.getEntityById(id)
                .map(dtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Tag", id));
    }

    @Override
    public List<TagDto> findAll() {
        return tagDao.listOfEntities()
                .stream()
                .map(dtoMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Transactional
    @Override
    public TagDto create(TagDto entity) {
        if (!tagDao.getTagByName(entity.getName()).isPresent()) {
            return dtoMapper.toDTO(tagDao
                    .createEntity(dtoMapper.toEntity(entity)));
        }
        throw new SuchTagAlreadyExistException(entity.getName());
    }

    @Transactional
    @Override
    public void remove(Long id) {
        final List<Certificate> certificateIds = certificateAndTagDao.listOfCertificatesByTags(id);
        certificateIds.forEach((certificate) -> certificateAndTagDao.removeEntity(id, certificate.getId()));
        if (!tagDao.removeEntity(id)) {
            throw new EntityNotFoundException("Tag", id);
        }
    }

    @Override
    public TagDto getMostUsefulTagByMostActiveUser() {
        return tagDao.getMostUsefulByMostActiveUser()
                .map(dtoMapper::toDTO)
                .get();
    }
}
