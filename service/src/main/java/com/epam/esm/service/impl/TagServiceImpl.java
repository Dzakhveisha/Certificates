package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.dto.TagDto;
import com.epam.esm.dto.mapper.TagDtoMapper;
import com.epam.esm.exception.TagNotFoundException;
import com.epam.esm.service.TagService;
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
        return dtoMapper.toDTO(jdbcTagDao.getTagByName(entity.getName()).get());
    }

    @Transactional
    @Override
    public void remove(Long id) {
        final List<Long> certificateIds = certificateAndTagDao.listOfCertificatesIdByTags(id);
        certificateIds.forEach((certificateId) -> certificateAndTagDao.removeEntity(id, certificateId));
        jdbcTagDao.removeEntity(id);
    }
}
