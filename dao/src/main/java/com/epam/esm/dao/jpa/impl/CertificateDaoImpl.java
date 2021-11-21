package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.model.Certificate;
import lombok.Data;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
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
    private final EntityManager em;

    public CertificateDaoImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    @Override
    public Class getEntityClass() {
        return Certificate.class;
    }


    @Override
    public Optional<Certificate> updateEntity(Long id, Certificate entity) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaUpdate<Certificate> criteriaUpdate = cb.createCriteriaUpdate(Certificate.class);
        Root<Certificate> root = criteriaUpdate.from(Certificate.class);
        setValuesForUpdating(entity, criteriaUpdate);
        criteriaUpdate.where(cb.equal(root.get(CERT_ID), id));

        em.createQuery(criteriaUpdate).executeUpdate();
        return this.getEntityById(id);
    }

    @Override
    public List<Certificate> sortListOfEntitiesWithCriteria(String sortBy, String order, String partName, String tagName) {
        if (!sortBy.equals(CERT_NAME) && !sortBy.equals(CERT_CREATE_DATE)) {
            sortBy = CERT_ID;
        }
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Certificate> criteriaQuery = criteriaBuilder.createQuery(Certificate.class);
        Root<Certificate> root = criteriaQuery.from(Certificate.class);
        criteriaQuery.select(root);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(criteriaBuilder.like(root.get(CERT_NAME), "%" + partName + "%"));

        if (tagName != null) {
            Join<Object, Object> tagListJoin = root.join("certificateAndTagList").join("tag");
            Predicate predicateTagsList = tagListJoin.get(CERT_NAME).in(tagName);
            predicates.add(predicateTagsList);
            criteriaQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])))
                    .groupBy(root);
        } else {
            criteriaQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[0])));
        }
        if (order.equals("DESC")) {
            criteriaQuery.orderBy(criteriaBuilder.desc(root.get(sortBy)));
        } else {
            criteriaQuery.orderBy(criteriaBuilder.asc(root.get(sortBy)));
        }
        //em.createNativeQuery()
        return em.createQuery(criteriaQuery).getResultList();
    }

    private void setValuesForUpdating(Certificate entity, CriteriaUpdate criteriaUpdate) {
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