package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.CustomTagRepository;
import com.epam.esm.dao.model.Tag;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;


@Repository
@AllArgsConstructor
public class CustomTagRepositoryImpl implements CustomTagRepository {

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

    @Override
    public Optional<Tag> findMostUsefulByMostActiveUser() {
        Query nativeQuery = entityManager.createNativeQuery(SQL_POPULAR_TAG, Tag.class);
        List<Tag> resultList = nativeQuery.getResultList();
        return (resultList.isEmpty()) ? Optional.empty() : Optional.ofNullable(resultList.get(0));
    }
}
