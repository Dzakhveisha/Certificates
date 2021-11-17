package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.model.CertificateAndTag;
import lombok.Data;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
@Data
public class CertificateAndTagDaoImpl implements CertificateAndTagDao {

    private static final String CERTIFICATE_ID = "certificateId";
    private static final String TAG_ID = "tagId";

    @PersistenceContext
    private final EntityManager em;

    public CertificateAndTagDaoImpl(EntityManager em) {
        this.em = em;
    }

    public List<CertificateAndTag> listOfAll() {

        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();

        CriteriaQuery<CertificateAndTag> criteria = criteriaBuilder.createQuery(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteria.from(CertificateAndTag.class);
        criteria.select(root);

        return em.createQuery(criteria).getResultList();
    }

    @Override
    public List<Long> listOfTagsIdByCertificate(Long certificateId) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();

        CriteriaQuery<CertificateAndTag> criteriaQuery = criteriaBuilder.createQuery(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaQuery.from(CertificateAndTag.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(CERTIFICATE_ID), certificateId));
        criteriaQuery.select(root);

        return em.createQuery(criteriaQuery).getResultList()
                .stream()
                .map(CertificateAndTag::getTagId)
                .collect(Collectors.toList());
    }

    @Override
    public List<Long> listOfCertificatesIdByTags(Long tagId) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();

        CriteriaQuery<CertificateAndTag> criteriaQuery = criteriaBuilder.createQuery(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaQuery.from(CertificateAndTag.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(TAG_ID), tagId));
        criteriaQuery.select(root);

        return em.createQuery(criteriaQuery).getResultList()
                .stream()
                .map(CertificateAndTag::getCertificateId)
                .collect(Collectors.toList());
    }

    @Override
    public boolean removeEntity(Long tagId, Long certificateId) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();

        CriteriaDelete<CertificateAndTag> criteriaDelete = criteriaBuilder.createCriteriaDelete(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaDelete.from(CertificateAndTag.class);

        criteriaDelete.where(criteriaBuilder.equal(root.get(CERTIFICATE_ID), certificateId));
        criteriaDelete.where(criteriaBuilder.equal(root.get(TAG_ID), tagId));

        int rowsDeleted = em.createQuery(criteriaDelete).executeUpdate();
        return rowsDeleted > 0;
    }

    @Override
    public CertificateAndTag createEntity(CertificateAndTag entity) {
        return em.merge(entity);
    }

    @Override
    public Optional<CertificateAndTag> getEntityByTagAndCertificate(Long certificateId, Long tagId) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();

        CriteriaQuery<CertificateAndTag> criteriaQuery = criteriaBuilder.createQuery(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaQuery.from(CertificateAndTag.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(CERTIFICATE_ID), certificateId));
        criteriaQuery.where(criteriaBuilder.equal(root.get(TAG_ID), tagId));
        criteriaQuery.select(root);

        return Optional.ofNullable(em.createQuery(criteriaQuery).getResultList().get(0));
    }
}
