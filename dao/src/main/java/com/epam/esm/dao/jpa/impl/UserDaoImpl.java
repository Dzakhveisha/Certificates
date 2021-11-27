package com.epam.esm.dao.jpa.impl;

import com.epam.esm.dao.jpa.UserDao;
import com.epam.esm.dao.model.User;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Optional;

import static com.epam.esm.dao.jpa.BaseDao.pageSize;

@Repository
@AllArgsConstructor
public class UserDaoImpl implements UserDao {
    @PersistenceContext
    private final EntityManager entityManager;

    @Override
    public List<User> listOf(int pageNumber) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<User> userCriteria = criteriaBuilder.createQuery(User.class);
        Root<User> root = userCriteria.from(User.class);
        userCriteria.select(root);

        if (getLastPageNumber() < pageNumber) {
            pageNumber = 1;
        }

        return entityManager.createQuery(userCriteria)
                .setFirstResult((pageNumber - 1) * pageSize)
                .setMaxResults(pageSize)
                .getResultList();
    }

    @Override
    public Optional<User> getById(Long id) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> userCriteria = criteriaBuilder.createQuery(User.class);
        Root<User> root = userCriteria.from(User.class);

        userCriteria.where(criteriaBuilder.equal(root.get("id"), id));
        List<User> resultList = entityManager.createQuery(userCriteria).getResultList();
        if (resultList.isEmpty()) {
            return Optional.empty();
        } else {
            return Optional.ofNullable(resultList.get(0));
        }
    }

    private int getLastPageNumber() {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery countQuery = criteriaBuilder.createQuery();
        Root<User> root = countQuery.from(User.class);
        countQuery.select(criteriaBuilder.count(root));

        Long countResult = (long) entityManager.createQuery(countQuery).getSingleResult();

        return (int) ((countResult / pageSize) + 1);
    }
}