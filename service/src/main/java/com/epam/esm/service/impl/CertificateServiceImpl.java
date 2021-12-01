package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.jpa.OrderDao;
import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateAndTag;
import com.epam.esm.dao.model.Criteria;
import com.epam.esm.dao.model.Order;
import com.epam.esm.dao.model.PageOfEntities;
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
    private final OrderDao orderDao;

    private final Mapper<Certificate, CertificateDto> certificateDtoMapper;
    private final Mapper<Tag, TagDto> tagDtoMapper;


    @Override
    public CertificateDto findById(Long id) {
        CertificateDto certificate = certificateDao.getById(id)
                .map(certificateDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Certificate", id));
        addTags(certificate);
        return certificate;
    }

    @Override
    public PageOfEntities<CertificateDto> findAll(int pageNumber) {
        PageOfEntities<Certificate> pageOfCertificates = certificateDao.listOf(pageNumber);
        PageOfEntities<CertificateDto> pageOfDtoCertificates = new PageOfEntities<>(pageOfCertificates.getCountOfPages(),
                pageOfCertificates.getCurPageNumber(),
                pageOfCertificates.getCurPage()
                        .stream()
                        .map(certificateDtoMapper::toDTO)
                        .collect(Collectors.toList()));
        pageOfDtoCertificates.getCurPage().forEach(this::addTags);
        return pageOfDtoCertificates;
    }

    @Transactional
    @Override
    public CertificateDto create(CertificateDto entity) {
        entity.setCreateDate(LocalDateTime.now().format(formatterToString));
        entity.setLastUpdateDate(entity.getCreateDate());
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        CertificateDto certificateNew = certificateDtoMapper.toDTO(certificateDao.create(newCertificateEntity));
        createTags(entity.getTags(), certificateNew);
        return certificateNew;
    }

    @Transactional
    @Override
    public CertificateDto update(Long id, CertificateDto entity) {
        validateCertificate(entity);
        entity.setLastUpdateDate(LocalDateTime.now().format(formatterToString));
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        CertificateDto certificate = certificateDao.update(id, newCertificateEntity)
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
        CertificateDto deletedCertificate = certificateDao.getById(id)
                .map(certificateDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Certificate", id));
        deleteTags(deletedCertificate);
        deleteOrders(deletedCertificate);
        if (!certificateDao.remove(id)) {
            throw new EntityNotFoundException("Certificate", id);
        }
    }

    private void deleteOrders(CertificateDto deletedCertificate) {
        final List<Order> orders = orderDao.getByCertificate(certificateDtoMapper.toEntity(deletedCertificate));
        for (Order order : orders) {
            orderDao.remove(order.getUser().getId(), deletedCertificate.getId());
        }
    }

    @Override
    public PageOfEntities<CertificateDto> sortAllWithCriteria(Criteria criteria, int pageNumber) {
        PageOfEntities<Certificate> certificatePage = certificateDao.sortListWithCriteria(criteria, pageNumber);
        PageOfEntities<CertificateDto> certificatesDtoPage = new PageOfEntities<>(
                certificatePage.getCountOfPages(), certificatePage.getCurPageNumber(),
                certificatePage.getCurPage()
                        .stream()
                        .map(certificateDtoMapper::toDTO)
                        .collect(Collectors.toList()));
        certificatesDtoPage.getCurPage().forEach(this::addTags);
        return certificatesDtoPage;
    }

    protected void createTags(List<TagDto> tags, CertificateDto certificate) {
        if (tags == null) {
            certificate.setTags(Collections.emptyList());
            return;
        }
        for (TagDto tag : tags) {
            TagDto newTag = getTag(tag);
            certificateAndTagDao.create(new CertificateAndTag(
                    certificateDao.getById(certificate.getId()).get(),
                    tagDao.getById(newTag.getId()).get())
            );
            certificate.addTag(newTag);
        }
    }

    private void deleteTags(CertificateDto certificate) {
        final List<Tag> tagsIds = certificateAndTagDao.listOfTagsByCertificate(certificate.getId());
        for (Tag tag : tagsIds) {
            certificateAndTagDao.remove(tag.getId(), certificate.getId());
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
        newTags = newTags.stream().map(this::getTag).collect(Collectors.toList());
        for (Tag oldTag : oldTags) {
            if (!newTags.contains(tagDtoMapper.toDTO(oldTag))) {
                certificateAndTagDao.remove(oldTag.getId(), certificate.getId());
            }
        }
        for (TagDto tag : newTags) {
            if (!certificateAndTagDao.getByTagAndCertificate(certificate.getId(), tag.getId()).isPresent()) {
                certificateAndTagDao.create(new CertificateAndTag(certificateDao.getById(certificate.getId()).get(),
                        tagDao.getById(tag.getId()).get()));
            }
            certificate.addTag(tag);
        }
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
            if (tagDao.getById(tag.getId()).isPresent()) {
                return tagDao.getById(tag.getId())
                        .map(tagDtoMapper::toDTO)
                        .get();
            } else {
                if (tag.getName() != null) {
                    if (!tagDao.getByName(tag.getName()).isPresent()) {
                        tagDao.create(tagDtoMapper.toEntity(tag));
                    }
                    return tagDao.getByName(tag.getName())
                            .map(tagDtoMapper::toDTO)
                            .get();
                } else throw new EntityNotFoundException("Certificate", tag.getId());
            }
        } else {
            if (!tagDao.getByName(tag.getName()).isPresent()) {
                tagDao.create(tagDtoMapper.toEntity(tag));
            }
            return tagDao.getByName(tag.getName())
                    .map(tagDtoMapper::toDTO)
                    .get();
        }
    }
}
