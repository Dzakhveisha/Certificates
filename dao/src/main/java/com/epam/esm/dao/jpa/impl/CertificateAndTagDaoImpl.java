package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateToTagRelation;
import com.epam.esm.dao.model.Tag;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Repository
@AllArgsConstructor
public class CertificateAndTagDaoImpl implements CertificateAndTagDao {

    private static final String CERTIFICATE = "certificate";
    private static final String TAG = "tag";
    private static final String ID = "id";

    @PersistenceContext
    private final EntityManager entityManager;

    @Override
    public List<Tag> findTagsByCertificate(Long certificateId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<CertificateToTagRelation> criteriaQuery = criteriaBuilder.createQuery(CertificateToTagRelation.class);
        Root<CertificateToTagRelation> root = criteriaQuery.from(CertificateToTagRelation.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(CERTIFICATE).get(ID), certificateId));
        criteriaQuery.select(root);

        return entityManager.createQuery(criteriaQuery)
                .getResultList()
                .stream()
                .map(CertificateToTagRelation::getTag)
                .collect(Collectors.toList());
    }

    @Override
    public List<Certificate> findCertificatesByTags(Long tagId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<CertificateToTagRelation> criteriaQuery = criteriaBuilder.createQuery(CertificateToTagRelation.class);
        Root<CertificateToTagRelation> root = criteriaQuery.from(CertificateToTagRelation.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(TAG).get(ID), tagId));
        criteriaQuery.select(root);

        return entityManager.createQuery(criteriaQuery).getResultList()
                .stream()
                .map(CertificateToTagRelation::getCertificate)
                .collect(Collectors.toList());
    }

    @Override
    public boolean remove(Long tagId, Long certificateId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaDelete<CertificateToTagRelation> criteriaDelete = criteriaBuilder.createCriteriaDelete(CertificateToTagRelation.class);
        Root<CertificateToTagRelation> root = criteriaDelete.from(CertificateToTagRelation.class);

        criteriaDelete.where(criteriaBuilder.equal(root.get(CERTIFICATE).get(ID), certificateId));
        criteriaDelete.where(criteriaBuilder.equal(root.get(TAG).get(ID), tagId));

        int rowsDeleted = entityManager.createQuery(criteriaDelete).executeUpdate();
        return rowsDeleted > 0;
    }

    @Override
    public CertificateToTagRelation create(CertificateToTagRelation entity) {
        entityManager.persist(entity);
        return entity;
    }

    @Override
    public Optional<CertificateToTagRelation> findByTagAndCertificate(Long certificateId, Long tagId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<CertificateToTagRelation> criteriaQuery = criteriaBuilder.createQuery(CertificateToTagRelation.class);
        Root<CertificateToTagRelation> root = criteriaQuery.from(CertificateToTagRelation.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(CERTIFICATE).get(ID), certificateId));
        criteriaQuery.where(criteriaBuilder.equal(root.get(TAG).get(ID), tagId));
        criteriaQuery.select(root);

        List<CertificateToTagRelation> resultList = entityManager.createQuery(criteriaQuery).getResultList();
        return (!resultList.isEmpty()) ? Optional.ofNullable(resultList.get(0)) : Optional.empty();
    }
}
