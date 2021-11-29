package com.epam.esm.dao.jpa;

import com.epam.esm.dao.model.BaseEntity;
import com.epam.esm.dao.model.PageOfEntities;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;

/**
 * Generic DAO, containing base operations with database
 *
 * @param <T> entities which DAO operates with
 */
public interface BaseDao<T extends BaseEntity> {

    Integer pageSize = 10;

    EntityManager getEntityManager();

    Class getEntityClass();

    /**
     * Create new entity in database
     *
     * @param entity entity for creating
     * @return created entity from database
     */

    default T create(T entity) {
        getEntityManager().persist(entity);
        return entity;
    }

    /**
     * Get entity by it's id from database
     *
     * @param id id of needed entity
     * @return needed entity
     */
    default Optional<T> getById(Long id) {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();

        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(getEntityClass());
        Root<T> root = criteriaQuery.from(getEntityClass());

        criteriaQuery.where(criteriaBuilder.equal(root.get("id"), id));
        criteriaQuery.select(root);

        List<T> resultList = getEntityManager().createQuery(criteriaQuery).getResultList();
        if (resultList.isEmpty()) {
            return Optional.empty();
        } else {
            return Optional.ofNullable(resultList.get(0));
        }
    }

    /**
     * Get page of all entities from database
     *
     * @return page of all entities from database
     */
    default PageOfEntities<T> listOf(int pageNumber) {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();

        CriteriaQuery<T> criteria = criteriaBuilder.createQuery(getEntityClass());
        Root<T> root = criteria.from(getEntityClass());
        criteria.select(root);

        return new PageOfEntities<>(getCountOfPages(), pageNumber,
                getEntityManager().createQuery(criteria)
                        .setFirstResult((pageNumber - 1) * pageSize)
                        .setMaxResults(pageSize)
                        .getResultList());
    }

    default int getCountOfPages() {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();
        CriteriaQuery countQuery = criteriaBuilder.createQuery();
        Root<T> root = countQuery.from(getEntityClass());
        countQuery.select(criteriaBuilder.count(root));

        Long countResult = (Long) getEntityManager().createQuery(countQuery).getResultList().stream().findFirst().orElse(1L);

        return (int) ((countResult % pageSize == 0) ? (countResult / pageSize) : (countResult / pageSize) + 1);
    }


    /**
     * Remove entity with such id in database
     *
     * @param id id of entity to be deleted
     * @return true, if  successful deletion, else false
     */
    default boolean remove(Long id) {
        CriteriaBuilder criteriaBuilder = getEntityManager().getCriteriaBuilder();

        CriteriaDelete<T> criteriaDelete = criteriaBuilder.createCriteriaDelete(getEntityClass());
        Root<T> root = criteriaDelete.from(getEntityClass());

        criteriaDelete.where(criteriaBuilder.equal(root.get("id"), id));
        int rowsDeleted = getEntityManager().createQuery(criteriaDelete).executeUpdate();
        return rowsDeleted > 0;
    }
}
