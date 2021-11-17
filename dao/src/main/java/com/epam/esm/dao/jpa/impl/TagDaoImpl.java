package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Tag;
import lombok.Data;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.Optional;


@Component
@Data
public class TagDaoImpl implements TagDao {

    private static final String TAG_NAME = "name";

    @PersistenceContext
    private final EntityManager em;

    public TagDaoImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    @Override
    public Class getEntityClass() {
        return Tag.class;
    }

    @Override
    public Optional<Tag> getTagByName(String name) {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();

        CriteriaQuery<Tag> criteriaQuery = criteriaBuilder.createQuery(Tag.class);
        Root<Tag> root = criteriaQuery.from(Tag.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(TAG_NAME), name));
        criteriaQuery.select(root);

        return Optional.ofNullable(getEntityManager().createQuery(criteriaQuery).getResultList().get(0));
    }
}
