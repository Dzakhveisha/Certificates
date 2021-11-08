package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcCertificateDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.dto.CertificateDto;
import com.epam.esm.dto.TagDto;
import com.epam.esm.dto.mapper.TagDtoMapper;
import com.epam.esm.exception.CertificateNotFoundException;
import com.epam.esm.dto.mapper.CertificateDtoMapper;

import com.epam.esm.model.Certificate;
import com.epam.esm.model.CertificateAndTag;
import com.epam.esm.service.CertificateService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CertificateServiceImpl implements CertificateService {

    private final JdbcCertificateDaoImpl certificateDao;
    private final JdbcTagDaoImpl tagDao;
    private final JdbcCertificateAndTagDaoImpl certificateAndTagDao;

    private final CertificateDtoMapper certificateDtoMapper;
    private final TagDtoMapper tagDtoMapper;


    @Override
    public CertificateDto findById(Long id) {
        CertificateDto certificate = certificateDtoMapper.toDTO(certificateDao.getEntityById(id)
                .orElseThrow(() -> new CertificateNotFoundException(id)));
        addTags(certificate);
        return certificate;
    }

    @Override
    public List<CertificateDto> findAll() {
        final List<CertificateDto> certificates = certificateDao.listOfEntities().stream()
                .map(certificateDtoMapper::toDTO).collect(Collectors.toList());
        certificates.forEach(this::addTags);
        return certificates;
    }

    @Transactional
    @Override
    public CertificateDto create(CertificateDto entity) {
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        CertificateDto certificateNew = certificateDtoMapper.toDTO(certificateDao.createEntity(newCertificateEntity));
        createTags(entity.getTags(), certificateNew);
        return certificateNew;
    }

    @Transactional
    @Override
    public CertificateDto update(Long id, CertificateDto entity) {
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        CertificateDto certificate = certificateDtoMapper.toDTO(certificateDao.updateEntity(id, newCertificateEntity)
                .orElseThrow(() -> new CertificateNotFoundException(id)));
        if (entity.getTags() != null) {
            updateTags(entity.getTags(), certificate);
        }
        return certificate;
    }

    private void updateTags(List<TagDto> newTags, CertificateDto certificate) {
        List<Long> oldTagsIds = certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId());
        oldTagsIds.forEach((oldTagId) -> {
            if (!newTags.contains(tagDao.getEntityById(oldTagId).get())) {
                certificateAndTagDao.removeEntity(oldTagId, certificate.getId());
            }
        });
        newTags.forEach(tag -> {
            if (!certificateAndTagDao.getEntityByTagAndCertificate(certificate.getId(), tag.getId()).isPresent()) {
                certificateAndTagDao.createEntity(new CertificateAndTag(certificate.getId(), tag.getId()));
            }
            certificate.addTag(tag);
        });
    }

    @Transactional
    @Override
    public boolean remove(Long id) {
        CertificateDto deletedCertificate = certificateDtoMapper.toDTO(certificateDao.getEntityById(id).orElseThrow(()-> new CertificateNotFoundException(id)));
        deleteTags(deletedCertificate);
        return certificateDao.removeEntity(id);
    }

    @Override
    public List<CertificateDto> sortAllWithCriteria(String sortBy, String order, String partName, String tagName) {
        List<CertificateDto> certificates = certificateDao.sortListOfEntitiesWithCriteria(sortBy, order, partName, tagName)
                .stream().map(certificateDtoMapper::toDTO).collect(Collectors.toList());
        certificates.forEach(this::addTags);
        return certificates;
    }

    private void createTags(List<TagDto> tags, CertificateDto certificate) {
        if (tags == null) {
            certificate.setTags(Collections.emptyList());
            return;
        }
        for (TagDto tag : tags) {
            if (!tagDao.getEntityById(tag.getId()).isPresent()) {
                tagDao.createEntity(tagDtoMapper.toEntity(tag));
            }
            certificateAndTagDao.createEntity(new CertificateAndTag(certificate.getId(), tag.getId()));
            certificate.addTag(tag);
        }
    }

    private void deleteTags(CertificateDto certificate) {
        final List<Long> tagsIds = certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId());
        for (Long tagId : tagsIds) {
            certificateAndTagDao.removeEntity(tagId, certificate.getId());
        }
    }

    private void addTags(CertificateDto certificate) {
        final List<Long> tagsIds = certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId());
        for (Long tagId : tagsIds) {
            certificate.addTag(tagDtoMapper.toDTO(tagDao.getEntityById(tagId).get()));
        }
    }
}
