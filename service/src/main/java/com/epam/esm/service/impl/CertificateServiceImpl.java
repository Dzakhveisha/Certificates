package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.CertificateAndTagRelatonRepository;
import com.epam.esm.dao.jpa.CertificateRepository;
import com.epam.esm.dao.jpa.OrderRepository;
import com.epam.esm.dao.jpa.TagRepository;
import com.epam.esm.dao.jpa.specification.CertificateSpecification;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateToTagRelation;
import com.epam.esm.dao.entity.Criteria;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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

    private final CertificateRepository certificateRepository;
    private final TagRepository tagRepository;
    private final CertificateAndTagRelatonRepository certificateAndTagRepository;
    private final OrderRepository orderRepository;

    private final Mapper<Certificate, CertificateDto> certificateDtoMapper;
    private final Mapper<Tag, TagDto> tagDtoMapper;


    @Override
    public CertificateDto findById(Long id) {
        CertificateDto certificate = certificateRepository.findById(id)
                .map(certificateDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Certificate", id));
        addTags(certificate);
        return certificate;
    }

    @Override
    public Page<CertificateDto> findAll(int pageNumber) {
        Page<Certificate> pageOfCertificates = certificateRepository.findAll(PageRequest.of(pageNumber - 1, 10));
        Page<CertificateDto> pageOfDtoCertificates = pageOfCertificates.map(certificateDtoMapper::toDTO);
        pageOfDtoCertificates.forEach(this::addTags);
        return pageOfDtoCertificates;
    }

    @Transactional
    @Override
    public CertificateDto create(CertificateDto entity) {
        entity.setCreateDate(LocalDateTime.now().format(formatterToString));
        entity.setLastUpdateDate(entity.getCreateDate());
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        CertificateDto certificateNew = certificateDtoMapper.toDTO(certificateRepository.save(newCertificateEntity));
        createTags(entity.getTags(), certificateNew);
        return certificateNew;
    }

    @Transactional
    @Override
    public CertificateDto update(Long id, CertificateDto entity) {
        validateCertificate(entity);
        entity.setLastUpdateDate(LocalDateTime.now().format(formatterToString));
        Certificate newCertificateEntity = certificateDtoMapper.toEntity(entity);
        if (!certificateRepository.findById(id).isPresent()){
            throw new EntityNotFoundException("Certificate", id);
        }
        Certificate oldCertificate = certificateRepository.getById(id);
        updateOldCertificate(oldCertificate, newCertificateEntity);
        CertificateDto certificate = certificateDtoMapper.toDTO(certificateRepository.save(oldCertificate));
        if (entity.getTags() != null) {
            updateTags(entity.getTags(), certificate);
        } else {
            addTags(certificate);
        }
        return certificate;
    }

    private void updateOldCertificate(Certificate oldCertificate, Certificate entity) {
        if (entity.getName() != null) {
            oldCertificate.setName(entity.getName());
        }
        if (entity.getDescription() != null) {
            oldCertificate.setDescription(entity.getDescription());

        }
        if (entity.getPrice() != null) {
            oldCertificate.setPrice(entity.getPrice());
        }
        if (entity.getDuration() != null) {
            oldCertificate.setDuration(entity.getDuration());
        }
        oldCertificate.setLastUpdateDate(entity.getLastUpdateDate());
    }

    @Transactional
    @Override
    public void remove(Long id) {
        CertificateDto deletedCertificate = certificateRepository.findById(id)
                .map(certificateDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Certificate", id));
        deleteTags(deletedCertificate);
        deleteOrders(deletedCertificate);
        certificateRepository.deleteById(id);
    }

    private void deleteOrders(CertificateDto deletedCertificate) {
        final List<Order> orders = orderRepository.findByCertificate(certificateDtoMapper.toEntity(deletedCertificate));
        for (Order order : orders) {
            orderRepository.deleteByUserIdAndCertificateId(order.getUser().getId(), deletedCertificate.getId());
        }
    }

    @Override
    public PageOfEntities<CertificateDto> sortAllWithCriteria(Criteria criteria, int pageNumber) {
        Page<Certificate> certificatePage = certificateRepository.findAll(new CertificateSpecification(criteria),
                PageRequest.of(pageNumber - 1,10));
        PageOfEntities<CertificateDto> certificatesDtoPage = new PageOfEntities<>(
                certificatePage.getTotalPages(), certificatePage.getPageable().getPageNumber() + 1,
                certificatePage.getContent()
                        .stream()
                        .map(certificateDtoMapper::toDTO)
                        .collect(Collectors.toList()));
        certificatesDtoPage.getPage().forEach(this::addTags);
        return certificatesDtoPage;
    }

    protected void createTags(List<TagDto> tags, CertificateDto certificate) {
        if (tags == null) {
            certificate.setTags(Collections.emptyList());
            return;
        }
        for (TagDto tag : tags) {
            TagDto newTag = getTag(tag);
            certificateAndTagRepository.save(new CertificateToTagRelation(
                    certificateRepository.findById(certificate.getId()).get(),
                    tagRepository.findById(newTag.getId()).get())
            );
            certificate.addTag(newTag);
        }
    }

    private void deleteTags(CertificateDto certificate) {
        final List<CertificateToTagRelation> relations = certificateAndTagRepository.findTagsByCertificateId(certificate.getId());
        for (CertificateToTagRelation relation : relations) {
            certificateAndTagRepository.deleteByTagIdAndCertificateId(relation.getTag().getId(), certificate.getId());
        }
    }

    private void addTags(CertificateDto certificate) {
        final List<CertificateToTagRelation> relations = certificateAndTagRepository.findTagsByCertificateId(certificate.getId());
        for (CertificateToTagRelation relation : relations) {
            certificate.addTag(tagDtoMapper.toDTO(tagRepository.getById(relation.getTag().getId())));
        }
    }

    private void updateTags(List<TagDto> newTags, CertificateDto certificate) {
        final List<CertificateToTagRelation> oldRelations = certificateAndTagRepository.findTagsByCertificateId(certificate.getId());
        newTags = newTags.stream().map(this::getTag).collect(Collectors.toList());
        for (CertificateToTagRelation oldRelation : oldRelations) {
            if (!newTags.contains(tagDtoMapper.toDTO(tagRepository.getById(oldRelation.getTag().getId())))) {
                certificateAndTagRepository.deleteByTagIdAndCertificateId(oldRelation.getTag().getId(), certificate.getId());
            }
        }
        for (TagDto tag : newTags) {
            if (!certificateAndTagRepository.findByTagIdAndCertificateId(certificate.getId(), tag.getId()).isPresent()) {
                certificateAndTagRepository.save(new CertificateToTagRelation(certificateRepository.findById(certificate.getId()).get(),
                        tagRepository.findById(tag.getId()).get()));
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
            if (tagRepository.findById(tag.getId()).isPresent()) {
                return tagRepository.findById(tag.getId())
                        .map(tagDtoMapper::toDTO)
                        .get();
            } else {
                if (tag.getName() != null) {
                    if (!tagRepository.findByName(tag.getName()).isPresent()) {
                        tagRepository.save(tagDtoMapper.toEntity(tag));
                    }
                    return tagRepository.findByName(tag.getName())
                            .map(tagDtoMapper::toDTO)
                            .get();
                } else throw new EntityNotFoundException("Tag", tag.getId());
            }
        } else {
            if (!tagRepository.findByName(tag.getName()).isPresent()) {
                tagRepository.save(tagDtoMapper.toEntity(tag));
            }
            return tagRepository.findByName(tag.getName())
                    .map(tagDtoMapper::toDTO)
                    .get();
        }
    }
}
