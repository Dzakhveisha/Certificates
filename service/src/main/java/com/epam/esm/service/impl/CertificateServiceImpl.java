package com.epam.esm.service.impl;

import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcCertificateDaoImpl;
import com.epam.esm.dao.impl.JdbcTagDaoImpl;
import com.epam.esm.model.Certificate;
import com.epam.esm.model.CertificateAndTag;
import com.epam.esm.model.Tag;
import com.epam.esm.service.CertificateService;
import com.epam.esm.exception.CertificateNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CertificateServiceImpl implements CertificateService {

    private final JdbcCertificateDaoImpl certificateDao;
    private final JdbcTagDaoImpl tagDao;
    private final JdbcCertificateAndTagDaoImpl certificateAndTagDao;

    @Override
    public Certificate findById(Long id) {
        Certificate certificate = certificateDao.getEntityById(id).orElseThrow(() -> new CertificateNotFoundException(id));
        addTags(certificate);
        return certificate;
    }

    @Override
    public List<Certificate> findAll() {
        final List<Certificate> certificates = certificateDao.listOfEntities();
        certificates.forEach(this::addTags);
        return certificates;
    }

    @Transactional
    @Override
    public Certificate create(Certificate entity) {
        entity.setCreateDate(LocalDateTime.now());
        entity.setLastUpdateDate(LocalDateTime.now());
        Certificate certificateNew = certificateDao.createEntity(entity);
        return updateTags(entity.getTags(), certificateNew);
    }

    @Transactional
    @Override
    public Certificate update(Long id, Certificate entity) {
        entity.setLastUpdateDate(LocalDateTime.now());
        Certificate certificate = certificateDao.updateEntity(id, entity).orElseThrow(() -> new CertificateNotFoundException(id));
        if (entity.getTags() != null) {
            deleteTags(certificate);
            return updateTags(entity.getTags(), certificate);
        }
        return certificate;
    }

    @Transactional
    @Override
    public boolean remove(Long id) {
        Optional<Certificate> deletedCertificate = certificateDao.getEntityById(id);
        deletedCertificate.ifPresent(this::deleteTags);
        return certificateDao.removeEntity(id);
    }

    @Override
    public List<Certificate> sortAllWithCriteria(String sortBy, String order, String partName, String tagName) {
        List<Certificate> certificates = certificateDao.sortListOfEntitiesWithCriteria(sortBy, order, partName, tagName);
        certificates.forEach(this::addTags);
        return certificates;
    }

    private Certificate updateTags(List<Tag> tags, Certificate certificate) {
        if (tags == null) {
            certificate.setTags(Collections.emptyList());
            return certificate;
        }
        for (Tag tag : tags) {
            if (!tagDao.getEntityById(tag.getId()).isPresent()) {
                tagDao.createEntity(tag);
            }
            certificateAndTagDao.createEntity(new CertificateAndTag(certificate.getId(), tag.getId()));
            certificate.addTag(tag);
        }
        return certificate;
    }

    private void deleteTags(Certificate certificate) {
        final List<Long> tagsIds = certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId());
        for (Long tagId : tagsIds) {
            certificateAndTagDao.removeEntity(tagId, certificate.getId());
        }
    }

    private void addTags(Certificate certificate) {
        final List<Long> tagsIds = certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId());
        for (Long tagId : tagsIds) {
            certificate.addTag(tagDao.getEntityById(tagId).get());
        }
    }
}
