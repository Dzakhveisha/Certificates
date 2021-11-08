package com.epam.esm.service.EntityService.impl;

import com.epam.esm.dao.jdbcDao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.jdbcDao.impl.JdbcCertificateDaoImpl;
import com.epam.esm.dao.jdbcDao.impl.JdbcTagDaoImpl;
import com.epam.esm.service.exception.ArgumentNotValidException;
import com.epam.esm.service.model.dto.CertificateDto;
import com.epam.esm.service.model.dto.TagDto;
import com.epam.esm.service.mapper.CertificateDtoMapper;
import com.epam.esm.service.mapper.TagDtoMapper;
import com.epam.esm.service.exception.CertificateNotFoundException;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateAndTag;
import com.epam.esm.service.EntityService.CertificateService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        validateCertificate(entity);
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        CertificateDto certificate = certificateDtoMapper.toDTO(certificateDao.updateEntity(id, newCertificateEntity)
                .orElseThrow(() -> new CertificateNotFoundException(id)));
        if (entity.getTags() != null) {
            updateTags(entity.getTags(), certificate);
        }
        else {
            addTags(certificate);
        }
        return certificate;
    }

    @Transactional
    @Override
    public void remove(Long id) {
        CertificateDto deletedCertificate = certificateDtoMapper.toDTO(certificateDao.getEntityById(id).orElseThrow(() -> new CertificateNotFoundException(id)));
        deleteTags(deletedCertificate);
        if (!certificateDao.removeEntity(id)){
            throw new CertificateNotFoundException(id);
        }
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
            if (!tagDao.getTagByName(tag.getName()).isPresent()) {
                tagDao.createEntity(tagDtoMapper.toEntity(tag));
            }
            TagDto newTag = tagDtoMapper.toDTO(tagDao.getTagByName(tag.getName()).get());
            certificateAndTagDao.createEntity(new CertificateAndTag(certificate.getId(), newTag.getId()));
            certificate.addTag(newTag);
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

    private void updateTags(List<TagDto> newTags, CertificateDto certificate) {
        List<Long> oldTagsIds = certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId());
        oldTagsIds.forEach((oldTagId) -> {
            if (!newTags.contains(tagDao.getEntityById(oldTagId).get())) {
                certificateAndTagDao.removeEntity(oldTagId, certificate.getId());
            }
        });
        newTags.forEach(tag -> {
            if (!tagDao.getTagByName(tag.getName()).isPresent()){
                tagDao.createEntity(tagDtoMapper.toEntity(tag));
            }
            TagDto newTag = tagDtoMapper.toDTO(tagDao.getTagByName(tag.getName()).get());
            if (!certificateAndTagDao.getEntityByTagAndCertificate(certificate.getId(), newTag.getId()).isPresent()) {
                certificateAndTagDao.createEntity(new CertificateAndTag(certificate.getId(), newTag.getId()));
            }
            certificate.addTag(newTag);
        });
    }

    private void validateCertificate(CertificateDto certificate) {
        if (certificate.getPrice() != null) {
            if (certificate.getPrice() < 0) {
                throw new ArgumentNotValidException(" Invalid price!");
            }
        }
        if (certificate.getDuration() != null) {
            if (certificate.getDuration() < 0) {
                throw new ArgumentNotValidException(" Invalid duration!");
            }
        }
    }
}
