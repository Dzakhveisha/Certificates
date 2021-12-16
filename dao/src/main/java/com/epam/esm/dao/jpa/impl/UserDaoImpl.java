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

@Repository
@AllArgsConstructor
public class UserDaoImpl implements UserDao {
    private static final String USER_NAME = "name";
    @PersistenceContext
    private final EntityManager entityManager;

    @Override
    public EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public Class getEntityClass() {
        return User.class;
    }

    @Override
    public Optional<User> findByName(String name) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
        Root<User> root = criteriaQuery.from(User.class);

        criteriaQuery.where(criteriaBuilder.equal(root.get(USER_NAME), name));
        criteriaQuery.select(root);

        List<User> resultList = getEntityManager().createQuery(criteriaQuery).getResultList();
        return (resultList.isEmpty()) ? Optional.empty() : Optional.ofNullable(resultList.get(0));
    }
}