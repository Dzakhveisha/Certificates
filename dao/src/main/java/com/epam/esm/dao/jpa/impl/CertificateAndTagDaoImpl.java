package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.CertificateAndTagDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.CertificateAndTag;
import com.epam.esm.dao.model.Tag;
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

import static com.epam.esm.dao.jpa.BaseDao.pageSize;

@Component
@Data
public class CertificateAndTagDaoImpl implements CertificateAndTagDao {

    private static final String CERTIFICATE = "certificate";
    private static final String TAG = "tag";

    @PersistenceContext
    private final EntityManager entityManager;

    public CertificateAndTagDaoImpl(EntityManager em) {
        this.entityManager = em;
    }

    @Override
    public List<Tag> listOfTagsByCertificate(Long certificateId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<CertificateAndTag> criteriaQuery = criteriaBuilder.createQuery(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaQuery.from(CertificateAndTag.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(CERTIFICATE).get("id"), certificateId));
        criteriaQuery.select(root);

        return entityManager.createQuery(criteriaQuery)
                .getResultList()
                .stream()
                .map(CertificateAndTag::getTag)
                .collect(Collectors.toList());
    }

    private int getLastPageNumber() {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
        CriteriaQuery countQuery = criteriaBuilder.createQuery();
        Root<CertificateAndTag> root = countQuery.from(CertificateAndTag.class);
        countQuery.select(criteriaBuilder.count(root));

        Long countResult = (long) getEntityManager().createQuery(countQuery).getSingleResult();

        return (int) ((countResult / pageSize) + 1);
    }

    @Override
    public List<Certificate> listOfCertificatesByTags(Long tagId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<CertificateAndTag> criteriaQuery = criteriaBuilder.createQuery(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaQuery.from(CertificateAndTag.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(TAG).get("id"), tagId));
        criteriaQuery.select(root);

        return entityManager.createQuery(criteriaQuery).getResultList()
                .stream()
                .map(CertificateAndTag::getCertificate)
                .collect(Collectors.toList());
    }

    @Override
    public boolean removeEntity(Long tagId, Long certificateId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaDelete<CertificateAndTag> criteriaDelete = criteriaBuilder.createCriteriaDelete(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaDelete.from(CertificateAndTag.class);

        criteriaDelete.where(criteriaBuilder.equal(root.get(CERTIFICATE).get("id"), certificateId));
        criteriaDelete.where(criteriaBuilder.equal(root.get(TAG).get("id"), tagId));

        int rowsDeleted = entityManager.createQuery(criteriaDelete).executeUpdate();
        return rowsDeleted > 0;
    }

    @Override
    public CertificateAndTag createEntity(CertificateAndTag entity) {
        entityManager.persist(entity);
        return entity;
    }

    @Override
    public Optional<CertificateAndTag> getEntityByTagAndCertificate(Long certificateId, Long tagId) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<CertificateAndTag> criteriaQuery = criteriaBuilder.createQuery(CertificateAndTag.class);
        Root<CertificateAndTag> root = criteriaQuery.from(CertificateAndTag.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(CERTIFICATE).get("id"), certificateId));
        criteriaQuery.where(criteriaBuilder.equal(root.get(TAG).get("id"), tagId));
        criteriaQuery.select(root);

        return Optional.ofNullable(entityManager.createQuery(criteriaQuery).getResultList().get(0));
    }
}
