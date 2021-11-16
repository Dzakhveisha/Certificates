package com.epam.esm.dao.jdbc.impl;

import com.epam.esm.dao.model.User;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@AllArgsConstructor
public class UserRepository {
    @PersistenceContext
    private final EntityManager em;

    public List<User> getAll(){
        CriteriaBuilder cb = em.getCriteriaBuilder();

        CriteriaQuery<User> userCriteria = cb.createQuery(User.class);
        Root<User> root = userCriteria.from(User.class);
        userCriteria.select(root);

        return em.createQuery(userCriteria).getResultList();
    }
}