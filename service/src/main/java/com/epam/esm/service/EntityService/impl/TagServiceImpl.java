package com.epam.esm.service.EntityService.impl;

import com.epam.esm.dao.jdbcDao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.jdbcDao.impl.JdbcTagDaoImpl;
import com.epam.esm.service.exception.SuchTagAlreadyExistException;
import com.epam.esm.service.model.dto.TagDto;
import com.epam.esm.service.mapper.TagDtoMapper;
import com.epam.esm.service.exception.TagNotFoundException;
import com.epam.esm.service.EntityService.TagService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TagServiceImpl implements TagService {

    private final JdbcTagDaoImpl jdbcTagDao;
    private final JdbcCertificateAndTagDaoImpl certificateAndTagDao;
    private final TagDtoMapper dtoMapper;

    @Override
    public TagDto findById(Long id) {
        return dtoMapper.toDTO(jdbcTagDao.getEntityById(id).orElseThrow(() -> new TagNotFoundException(id)));
    }

    @Override
    public List<TagDto> findAll() {
        return jdbcTagDao.listOfEntities().stream().map(dtoMapper::toDTO).collect(Collectors.toList());
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
        if (!jdbcTagDao.removeEntity(id)){
            throw new TagNotFoundException(id);
        }
    }
}
