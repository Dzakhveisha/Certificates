package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateAndTag;
import com.epam.esm.dao.model.Tag;
import com.epam.esm.service.CertificateService;
import com.epam.esm.service.exception.ArgumentNotValidException;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.Mapper;
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

    private final Mapper<Certificate, CertificateDto> certificateDtoMapper;
    private final Mapper<Tag, TagDto> tagDtoMapper;


    @Override
    public CertificateDto findById(Long id) {
        CertificateDto certificate = certificateDao.getEntityById(id)
                .map(certificateDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Certificate", id));
        addTags(certificate);
        return certificate;
    }

    @Override
    public List<CertificateDto> findAll(int pageNumber) {
        final List<CertificateDto> certificates = certificateDao.listOfEntities(pageNumber)
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
        entity.setLastUpdateDate(LocalDateTime.now().format(formatterToString));
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        CertificateDto certificate = certificateDao.updateEntity(id, newCertificateEntity)
                .map(certificateDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Certificate", id));
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
        CertificateDto deletedCertificate = certificateDao.getEntityById(id)
                .map(certificateDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Certificate", id));
        deleteTags(deletedCertificate);
        if (!certificateDao.removeEntity(id)) {
            throw new EntityNotFoundException("Certificate", id);
        }
    }

    @Override
    public List<CertificateDto> sortAllWithCriteria(String sortBy, String order, String partName, List<String> tagNames, int pageNumber) {
        List<CertificateDto> certificates = certificateDao.sortListOfEntitiesWithCriteria(sortBy, order, partName, tagNames, pageNumber)
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
            certificateAndTagDao.createEntity(new CertificateAndTag(
                    certificateDtoMapper.toEntity(certificate),
                    tagDtoMapper.toEntity(newTag))
            );
            certificate.addTag(newTag);
        }
    }

    private void deleteTags(CertificateDto certificate) {
        final List<Tag> tagsIds = certificateAndTagDao.listOfTagsByCertificate(certificate.getId());
        for (Tag tag : tagsIds) {
            certificateAndTagDao.removeEntity(tag.getId(), certificate.getId());
        }
    }

    private void addTags(CertificateDto certificate) {
        final List<Tag> tags = certificateAndTagDao.listOfTagsByCertificate(certificate.getId());
        for (Tag tag : tags) {
            certificate.addTag(tagDtoMapper.toDTO(tag));
        }
    }

    private void updateTags(List<TagDto> newTags, CertificateDto certificate) {
        List<Tag> oldTags = certificateAndTagDao.listOfTagsByCertificate(certificate.getId());
        oldTags.forEach((oldTag) -> {
            if (!newTags.contains(tagDtoMapper.toDTO(oldTag))) {
                certificateAndTagDao.removeEntity(oldTag.getId(), certificate.getId());
            }
        });
        newTags.forEach(tag -> {
            TagDto newTag = getTag(tag);
            if (!certificateAndTagDao.getEntityByTagAndCertificate(certificate.getId(), newTag.getId()).isPresent()) {
                certificateAndTagDao.createEntity(new CertificateAndTag(certificateDtoMapper.toEntity(certificate),
                        tagDtoMapper.toEntity(newTag)));
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
        if (tag.getName() == null && tag.getId() == null) {
            throw new ArgumentNotValidException("tag's name and id are null!");
        }
        if (tag.getId() != null) {
            if (tagDao.getEntityById(tag.getId()).isPresent()) {
                return tagDao.getEntityById(tag.getId())
                        .map(tagDtoMapper::toDTO)
                        .get();
            } else {
                if (tag.getName() != null) {
                    if (!tagDao.getTagByName(tag.getName()).isPresent()) {
                        tagDao.createEntity(tagDtoMapper.toEntity(tag));
                    }
                    return tagDao.getTagByName(tag.getName())
                            .map(tagDtoMapper::toDTO)
                            .get();
                } else throw new EntityNotFoundException("Certificate", tag.getId());
            }
        } else {
            if (!tagDao.getTagByName(tag.getName()).isPresent()) {
                tagDao.createEntity(tagDtoMapper.toEntity(tag));
            }
            return tagDao.getTagByName(tag.getName())
                    .map(tagDtoMapper::toDTO)
                    .get();
        }
    }
}
