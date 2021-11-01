package com.epam.esm.service.impl;

import com.epam.esm.dao.BaseDao;
import com.epam.esm.dao.impl.JdbcCertificateAndTagDaoImpl;
import com.epam.esm.dao.impl.JdbcCertificateDaoImpl;
import com.epam.esm.model.Certificate;
import com.epam.esm.model.CertificateAndTag;
import com.epam.esm.model.Tag;
import com.epam.esm.service.CertificateService;
import com.epam.esm.service.exception.CertificateNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CertificateServiceImpl implements CertificateService {

    private final BaseDao<Certificate> certificateDao;
    private final BaseDao<Tag> tagDao;
    private final JdbcCertificateAndTagDaoImpl certificateAndTagDao;

    @Override
    public Certificate findById(Long id) {
        Certificate certificate = certificateDao.getEntityById(id).orElseThrow(() -> new CertificateNotFoundException(id));
        return addTags(certificate);
    }

    @Override
    public List<Certificate> findAll() {
        final List<Certificate> certificates = certificateDao.listOfEntities();
        certificates.forEach((certificate) -> certificate = addTags(certificate));
        return certificates;
    }

    @Override
    public Certificate create(Certificate entity) {
        entity.setCreateDate(LocalDateTime.now());
        entity.setLastUpdateDate(LocalDateTime.now());
        Certificate certificateNew = certificateDao.createEntity(entity);
        return updateTags(entity.getTags(), certificateNew);
    }

    @Override
    public Certificate update(Long id, Certificate entity) {
        entity.setLastUpdateDate(LocalDateTime.now());
        Certificate certificate = ((JdbcCertificateDaoImpl) certificateDao).updateEntity(id, entity).orElseThrow(() -> new CertificateNotFoundException(id));
        if (entity.getTags() != null) {
            deleteTags(certificate);
            return updateTags(entity.getTags(), certificate);
        }
        return certificate;
    }

    @Override
    public boolean remove(Long id) {
        Optional<Certificate> deletedCertificate = certificateDao.getEntityById(id);
        deletedCertificate.ifPresent(this::deleteTags);
        return certificateDao.removeEntity(id);
    }

    private Certificate updateTags(List<Tag> tags, Certificate certificate) {
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

    private Certificate addTags(Certificate certificate) {
        final List<Long> tagsIds = certificateAndTagDao.listOfTagsIdByCertificate(certificate.getId());
        for (Long tagId : tagsIds) {
            certificate.addTag(tagDao.getEntityById(tagId).get());
        }
        return certificate;
    }
}
