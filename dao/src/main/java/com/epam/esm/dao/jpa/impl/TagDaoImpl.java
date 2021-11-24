package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.TagDao;
import com.epam.esm.dao.model.Tag;
import lombok.Data;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;


@Component
@Data
public class TagDaoImpl implements TagDao {

    private static final String TAG_NAME = "name";
    private static final String SQL_POPULAR_TAG =
            "select * " +
            "from tags " +
            "where tags.id = ( " +
            "    select tag_id " +
            "    from (select tag_id, count(tag_id) as value_occurrence " +
            "          from (select ct.tag_id " +
            "                from certificates " +
            "                         join user_orders o on certificates.id = o.certificate_id " +
            "                         join certificate_tag ct on certificates.id = ct.certificate_id " +
            "                where o.user_id = (select user " +
            "                                   from (select user_id as user " +
            "                                         from user_orders " +
            "                                         group by user_orders.user_id " +
            "                                         order by sum(price) DESC " +
            "                                         limit 1) " +
            "                                            as mostActiveUser)) " +
            "                   as popularTags " +
            "          group by tag_id " +
            "          order by value_occurrence DESC " +
            "          limit 1 " +
            "         ) as mostPopularTag);";


    @PersistenceContext
    private final EntityManager entityManager;

    public TagDaoImpl(EntityManager em) {
        this.entityManager = em;
    }

    @Override
    public EntityManager getEntityManager() {
        return entityManager;
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

        List<Tag> resultList = getEntityManager().createQuery(criteriaQuery).getResultList();
        if (resultList.isEmpty()){
            return Optional.empty();
        }
        else{
            return Optional.ofNullable(resultList.get(0));
        }
    }

    @Override
    public Optional<Tag> getMostUsefulByMostActiveUser() {
        Query nativeQuery = getEntityManager().createNativeQuery(SQL_POPULAR_TAG, Tag.class);
        List<Tag> resultList = nativeQuery.getResultList();
        if (resultList.isEmpty()){
            return Optional.empty();
        }
        else{
            return Optional.ofNullable(resultList.get(0));
        }
    }
}
