package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

/**
 * DAO for Tag entity
 */
public interface TagRepository extends JpaRepository<Tag, Long> {
    /**
     * Get entity by it's name from database
     *
     * @param name name of needed tag
     * @return found tag with such name
     */
    Optional<Tag> findByName(String name);

    /**
     * Find the most used tag by the user with the largest amount of orders
     *
     * @return tag
     */
    @Query(nativeQuery = true, value = "select * " +
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
            "         ) as mostPopularTag);")
    Optional<Tag> findMostUseful();
}
