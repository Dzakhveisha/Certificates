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
    @PersistenceContext
    private final EntityManager em;

    @Override
    public List<User> listOfAll() {
        CriteriaBuilder cb = em.getCriteriaBuilder();

        CriteriaQuery<User> userCriteria = cb.createQuery(User.class);
        Root<User> root = userCriteria.from(User.class);
        userCriteria.select(root);

        return em.createQuery(userCriteria).getResultList();
    }

    @Override
    public Optional<User> getById(Long id) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> userCriteria = cb.createQuery(User.class);
        Root<User> root = userCriteria.from(User.class);

        userCriteria.where(cb.equal(root.get("id"), id));
        List<User> resultList = em.createQuery(userCriteria).getResultList();
        if (resultList.isEmpty()) {
            return Optional.empty();
        } else {
            return Optional.ofNullable(resultList.get(0));
        }
    }
}