package com.epam.esm.dao.jpa.specification;

import com.epam.esm.dao.entity.Criteria;
import com.epam.esm.dao.model.Certificate;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

public class CertificateSpecification implements Specification<Certificate> {

    private static final String CERT_ID = "id";
    private static final String CERT_NAME = "name";
    private static final String CERT_CREATE_DATE = "createDate";

    private final Criteria criteria;

    public CertificateSpecification(Criteria criteria) {
        this.criteria = criteria;
    }


    @Override
    public Predicate toPredicate(Root<Certificate> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
        if (!criteria.getSortBy().equals(CERT_NAME) && !criteria.getSortBy().equals(CERT_CREATE_DATE)) {
            criteria.setSortBy(CERT_ID);
        }
        if (criteria.getOrder().equals("DESC")) {
            query.orderBy(criteriaBuilder.desc(root.get(criteria.getSortBy())));
        } else {
            query.orderBy(criteriaBuilder.asc(root.get(criteria.getSortBy())));
        }
        return applyPredicates(criteriaBuilder, root, criteria, query);

    }

    private Predicate applyPredicates(CriteriaBuilder criteriaBuilder, Root root, Criteria criteria, CriteriaQuery query) {
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(criteriaBuilder.like(root.get(CERT_NAME), "%" + criteria.getPartName() + "%"));
        if (criteria.getTagNames() != null) {
            Join<Object, Object> tagListJoin = root.join("certificateToTagRelationList").join("tag");
            Predicate predicateTagsList = tagListJoin.get(CERT_NAME).in(criteria.getTagNames());
            predicates.add(predicateTagsList);
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        } else {
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        }
    }
}
