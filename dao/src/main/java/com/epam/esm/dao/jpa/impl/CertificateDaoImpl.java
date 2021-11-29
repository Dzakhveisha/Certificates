package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.model.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import lombok.Data;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
@Data
public class CertificateDaoImpl implements CertificateDao {

    private static final String CERT_ID = "id";
    private static final String CERT_NAME = "name";
    private static final String CERT_DESCRIPTION = "description";
    private static final String CERT_PRICE = "price";
    private static final String CERT_DURATION = "duration";
    private static final String CERT_CREATE_DATE = "createDate";
    private static final String CERT_LAST_UPDATE_DATE = "lastUpdateDate";

    @PersistenceContext
    private final EntityManager entityManager;

    public CertificateDaoImpl(EntityManager em) {
        this.entityManager = em;
    }

    @Override
    public EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public Class getEntityClass() {
        return Certificate.class;
    }


    @Override
    public Optional<Certificate> update(Long id, Certificate entity) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaUpdate<Certificate> criteriaUpdate = criteriaBuilder.createCriteriaUpdate(Certificate.class);
        Root<Certificate> root = criteriaUpdate.from(Certificate.class);
        setValuesForUpdating(entity, criteriaUpdate);
        criteriaUpdate.where(criteriaBuilder.equal(root.get(CERT_ID), id));

        entityManager.createQuery(criteriaUpdate).executeUpdate();
        return this.getById(id);
    }

    @Override
    public PageOfEntities<Certificate> sortListWithCriteria(Criteria criteria, int pageNumber) {
        if (!criteria.getSortBy().equals(CERT_NAME) && !criteria.getSortBy().equals(CERT_CREATE_DATE)) {
            criteria.setSortBy(CERT_ID);
        }
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Certificate> criteriaQuery = criteriaBuilder.createQuery(Certificate.class);
        Root<Certificate> root = criteriaQuery.from(Certificate.class);
        criteriaQuery.select(root);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(criteriaBuilder.like(root.get(CERT_NAME), "%" + criteria.getPartName() + "%"));

        if (criteria.getTagNames() != null) {
            Join<Object, Object> tagListJoin = root.join("certificateAndTagList").join("tag");
            Expression<Long> countOfTags = criteriaBuilder.count(root);
            Predicate predicateTagsList = tagListJoin.get(CERT_NAME).in(criteria.getTagNames());
            predicates.add(predicateTagsList);
            criteriaQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])))
                    .having(criteriaBuilder.equal(countOfTags, criteria.getTagNames().size()))
                    .groupBy(root);
        } else {
            criteriaQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])));
        }
        if (criteria.getOrder().equals("DESC")) {
            criteriaQuery.orderBy(criteriaBuilder.desc(root.get(criteria.getSortBy())));
        } else {
            criteriaQuery.orderBy(criteriaBuilder.asc(root.get(criteria.getSortBy())));
        }

        return new PageOfEntities<>(countOfPages(criteria), pageNumber,
                entityManager.createQuery(criteriaQuery)
                        .setFirstResult((pageNumber - 1) * pageSize)
                        .setMaxResults(pageSize)
                        .getResultList());
    }

    private Integer countOfPages(Criteria criteria) {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Object> countQuery = criteriaBuilder.createQuery();
        Root<Certificate> root = countQuery.from(Certificate.class);
        countQuery.select(criteriaBuilder.count(root));

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(criteriaBuilder.like(root.get(CERT_NAME), "%" + criteria.getPartName() + "%"));

        if (criteria.getTagNames() != null) {
            Join<Object, Object> tagListJoin = root.join("certificateAndTagList").join("tag");
            Expression<Long> countOfTags = criteriaBuilder.count(root);
            Predicate predicateTagsList = tagListJoin.get(CERT_NAME).in(criteria.getTagNames());
            predicates.add(predicateTagsList);
            countQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])))
                    .having(criteriaBuilder.equal(countOfTags, criteria.getTagNames().size()))
                    .groupBy(root);
        } else {
            countQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])));
        }

        Integer countResult = (int) getEntityManager().createQuery(countQuery).getResultList().stream().findFirst().orElse(0);
        return (countResult / pageSize) + 1;
    }

    private void setValuesForUpdating(Certificate entity, CriteriaUpdate<Certificate> criteriaUpdate) {
        if (entity.getName() != null) {
            criteriaUpdate.set(CERT_NAME, entity.getName());
        }
        if (entity.getDescription() != null) {
            criteriaUpdate.set(CERT_DESCRIPTION, entity.getDescription());
        }
        if (entity.getPrice() != null) {
            criteriaUpdate.set(CERT_PRICE, entity.getPrice());
        }
        if (entity.getDuration() != null) {
            criteriaUpdate.set(CERT_DURATION, entity.getDuration());
        }
        criteriaUpdate.set(CERT_LAST_UPDATE_DATE, entity.getLastUpdateDate());
    }
}
