package com.epam.esm.service.impl;

import com.epam.esm.dao.BaseDao;
import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.model.Tag;
import com.epam.esm.service.TagService;
import com.epam.esm.exception.TagNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TagServiceImpl implements TagService {

    private final BaseDao<Tag> jdbcTagDao;
    private final JdbcCertificateAndTagDaoImpl certificateAndTagDao;

    @Override
    public Tag findById(Long id) {
        return jdbcTagDao.getEntityById(id).orElseThrow(() -> new TagNotFoundException(id));
    }

    @Override
    public List<Tag> findAll() {
        return jdbcTagDao.listOfEntities();
    }

    @Override
    public Tag create(Tag entity) {
        return jdbcTagDao.createEntity(entity);
    }

    @Transactional
    @Override
    public void remove(Long id) {
        final List<Long> certificateIds = certificateAndTagDao.listOfCertificatesIdByTags(id);
        certificateIds.forEach((certificateId) -> certificateAndTagDao.removeEntity(id, certificateId));
        jdbcTagDao.removeEntity(id);
    }
}
