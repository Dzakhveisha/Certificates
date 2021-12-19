package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.CustomCertificateRepository;
import com.epam.esm.dao.model.Certificate;
import com.epam.esm.dao.entity.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Repository
@AllArgsConstructor
public class CustomCertificateRepositoryImpl implements CustomCertificateRepository {

    private static final String CERT_ID = "id";
    private static final String CERT_NAME = "name";
    private static final String CERT_DESCRIPTION = "description";
    private static final String CERT_PRICE = "price";
    private static final String CERT_DURATION = "duration";
    private static final String CERT_CREATE_DATE = "createDate";
    private static final String CERT_LAST_UPDATE_DATE = "lastUpdateDate";

    private static final int pageSize = 10;
    @PersistenceContext
    private final EntityManager entityManager;


    @Override
    public PageOfEntities<Certificate> findWithCriteria(Criteria criteria, int pageNumber) {
        if (!criteria.getSortBy().equals(CERT_NAME) && !criteria.getSortBy().equals(CERT_CREATE_DATE)) {
            criteria.setSortBy(CERT_ID);
        }
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Certificate> criteriaQuery = criteriaBuilder.createQuery(Certificate.class);
        Root<Certificate> root = criteriaQuery.from(Certificate.class);
        criteriaQuery.select(root);

        applyPredicates(criteriaBuilder, root, criteria, criteriaQuery);
        if (criteria.getOrder().equals("DESC")) {
            criteriaQuery.orderBy(criteriaBuilder.desc(root.get(criteria.getSortBy())));
        } else {
            criteriaQuery.orderBy(criteriaBuilder.asc(root.get(criteria.getSortBy())));
        }

        return new PageOfEntities<>(getCountOfPages(criteria), pageNumber,
                entityManager.createQuery(criteriaQuery)
                        .setFirstResult((pageNumber - 1) * pageSize)
                        .setMaxResults(pageSize)
                        .getResultList());
    }

    private Integer getCountOfPages(Criteria criteria) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Object> countQuery = criteriaBuilder.createQuery();
        Root<Certificate> root = countQuery.from(Certificate.class);
        countQuery.select(criteriaBuilder.count(root));

        applyPredicates(criteriaBuilder, root, criteria, countQuery);
        Long countResult = (Long) entityManager.createQuery(countQuery).getResultList().stream().findFirst().orElse(1L);
        return (int) ((countResult % pageSize == 0) ? (countResult / pageSize) : (countResult / pageSize) + 1);
    }

    private void applyPredicates(CriteriaBuilder criteriaBuilder, Root root, Criteria criteria, CriteriaQuery query) {
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(criteriaBuilder.like(root.get(CERT_NAME), "%" + criteria.getPartName() + "%"));
        if (criteria.getTagNames() != null) {
            Join<Object, Object> tagListJoin = root.join("certificateToTagRelationList").join("tag");
            Expression<Long> countOfTags = criteriaBuilder.count(root);
            Predicate predicateTagsList = tagListJoin.get(CERT_NAME).in(criteria.getTagNames());
            predicates.add(predicateTagsList);
            query.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])))
                    .having(criteriaBuilder.equal(countOfTags, criteria.getTagNames().size()))
                    .groupBy(root);
        } else {
            query.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])));
        }
    }
}
