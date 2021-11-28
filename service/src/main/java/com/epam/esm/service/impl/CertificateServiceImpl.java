package com.epam.esm.service.impl;

import com.epam.esm.dao.jdbc.CertificateAndTagDao;
import com.epam.esm.dao.jdbc.CertificateDao;
import com.epam.esm.dao.jdbc.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateAndTag;
import com.epam.esm.service.CertificateService;
import com.epam.esm.service.exception.ArgumentNotValidException;
import com.epam.esm.service.exception.CertificateNotFoundException;
import com.epam.esm.service.exception.TagNotFoundException;
import com.epam.esm.service.mapper.CertificateDtoMapper;
import com.epam.esm.service.mapper.TagDtoMapper;
import com.epam.esm.service.model.dto.CertificateDto;
import com.epam.esm.service.model.dto.TagDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CertificateServiceImpl implements CertificateService {

    private static final String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
    private final DateTimeFormatter formatterToString = DateTimeFormatter.ofPattern(DATE_TIME_PATTERN);

    private final CertificateDao certificateDao;
    private final TagDao tagDao;
    private final CertificateAndTagDao certificateAndTagDao;

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
        final List<CertificateDto> certificates = certificateDao.listOfEntities()
                .stream()
                .map(certificateDtoMapper::toDTO)
                .collect(Collectors.toList());
        certificates.forEach(this::addTags);
        return certificates;
    }

    @Transactional
    @Override
    public CertificateDto create(CertificateDto entity) {
        entity.setCreateDate(LocalDateTime.now().format(formatterToString));
        entity.setLastUpdateDate(entity.getCreateDate());
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
        } else {
            addTags(certificate);
        }
        return certificate;
    }

    @Transactional
    @Override
    public void remove(Long id) {
        CertificateDto deletedCertificate = certificateDtoMapper.toDTO(certificateDao.getEntityById(id)
                .orElseThrow(() -> new CertificateNotFoundException(id)));
        deleteTags(deletedCertificate);
        if (!certificateDao.removeEntity(id)) {
            throw new CertificateNotFoundException(id);
        }
    }

    @Override
    public List<CertificateDto> sortAllWithCriteria(String sortBy, String order, String partName, String tagName) {
        List<CertificateDto> certificates = certificateDao.sortListOfEntitiesWithCriteria(sortBy, order, partName, tagName)
                .stream()
                .map(certificateDtoMapper::toDTO)
                .collect(Collectors.toList());
        certificates.forEach(this::addTags);
        return certificates;
    }

    private void createTags(List<TagDto> tags, CertificateDto certificate) {
        if (tags == null) {
            certificate.setTags(Collections.emptyList());
            return;
        }
        for (TagDto tag : tags) {
            TagDto newTag = getTag(tag);
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
            if (!newTags.contains(tagDtoMapper.toDTO(tagDao.getEntityById(oldTagId).get()))) {
                certificateAndTagDao.removeEntity(oldTagId, certificate.getId());
            }
        });
        newTags.forEach(tag -> {
            TagDto newTag = getTag(tag);
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

    private TagDto getTag(TagDto tag) {
        if (tag.getName() == null && tag.getId() == null){
            throw new ArgumentNotValidException("tag's name and id are null!");
        }
        if (tag.getId() != null){
            if (tagDao.getEntityById(tag.getId()).isPresent()) {
                return tagDtoMapper.toDTO(tagDao.getEntityById(tag.getId()).get());
            }
            else{
                if (tag.getName() != null) {
                    if (!tagDao.getTagByName(tag.getName()).isPresent()) {
                        tagDao.createEntity(tagDtoMapper.toEntity(tag));
                    }
                    return tagDtoMapper.toDTO(tagDao.getTagByName(tag.getName()).get());
                }
                else throw new TagNotFoundException(tag.getId());
            }
        }
        else{
            if (!tagDao.getTagByName(tag.getName()).isPresent()) {
                tagDao.createEntity(tagDtoMapper.toEntity(tag));
            }
            return tagDtoMapper.toDTO(tagDao.getTagByName(tag.getName()).get());
        }
    }
}
