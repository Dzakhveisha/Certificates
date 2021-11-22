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
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;


@Component
@Data
public class TagDaoImpl implements TagDao {

    private static final String TAG_NAME = "name";
    private static final String SQL_POPULAR_TAG =
            "select *\n" +
            "from tags\n" +
            "where tags.id = (\n" +
            "    select tag_id\n" +
            "    from (select tag_id, count(tag_id) as value_occurrence\n" +
            "          from (select ct.tag_id\n" +
            "                from certificates\n" +
            "                         join orders o on certificates.id = o.certificate_id\n" +
            "                         join certificate_tag ct on certificates.id = ct.certificate_id\n" +
            "                where o.user_id = (select user\n" +
            "                                   from (SELECT user_id as user\n" +
            "                                         FROM orders\n" +
            "                                         GROUP BY orders.user_id\n" +
            "                                         order by sum(price) DESC\n" +
            "                                         LIMIT 1)\n" +
            "                                            as mostActiveUser))\n" +
            "                   as popularTags\n" +
            "          GROUP BY tag_id\n" +
            "          order by value_occurrence DESC\n" +
            "          LIMIT 1\n" +
            "         ) as mostPopularTag);";


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
