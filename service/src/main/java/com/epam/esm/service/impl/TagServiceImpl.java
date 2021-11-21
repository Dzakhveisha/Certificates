package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.TagService;
import com.epam.esm.service.exception.SuchTagAlreadyExistException;
import com.epam.esm.service.exception.TagNotFoundException;
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

    private final TagDao jdbcTagDao;
    private final CertificateAndTagDao certificateAndTagDao;
    private final Mapper<Tag, TagDto> dtoMapper;

    @Override
    public TagDto findById(Long id) {
        return dtoMapper.toDTO(jdbcTagDao.getEntityById(id).orElseThrow(() -> new TagNotFoundException(id)));
    }

    @Override
    public List<TagDto> findAll() {
        return jdbcTagDao.listOfEntities()
                .stream()
                .map(dtoMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Transactional
    @Override
    public TagDto create(TagDto entity) {
        if (!jdbcTagDao.getTagByName(entity.getName()).isPresent()) {
            return dtoMapper.toDTO(jdbcTagDao
                    .createEntity(dtoMapper.toEntity(entity)));
        }
        throw new SuchTagAlreadyExistException(entity.getName());
    }

    @Transactional
    @Override
    public void remove(Long id) {
        final List<Certificate> certificateIds = certificateAndTagDao.listOfCertificatesByTags(id);
        certificateIds.forEach((certificate) -> certificateAndTagDao.removeEntity(id, certificate.getId()));
        if (!jdbcTagDao.removeEntity(id)) {
            throw new TagNotFoundException(id);
        }
    }
}
