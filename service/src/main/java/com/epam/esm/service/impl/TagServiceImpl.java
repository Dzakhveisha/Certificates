package com.epam.esm.service.impl;

import com.epam.esm.dao.jdbc.CertificateAndTagDao;
import com.epam.esm.dao.jdbc.TagDao;
import com.epam.esm.service.TagService;
import com.epam.esm.service.exception.SuchTagAlreadyExistException;
import com.epam.esm.service.exception.TagNotFoundException;
import com.epam.esm.service.mapper.TagDtoMapper;
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
    private final TagDtoMapper dtoMapper;

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
        final List<Long> certificateIds = certificateAndTagDao.listOfCertificatesIdByTags(id);
        certificateIds.forEach((certificateId) -> certificateAndTagDao.removeEntity(id, certificateId));
        if (!jdbcTagDao.removeEntity(id)) {
            throw new TagNotFoundException(id);
        }
    }
}
