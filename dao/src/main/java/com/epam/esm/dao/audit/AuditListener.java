package com.epam.esm.dao.audit;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.persistence.PostLoad;
import javax.persistence.PostPersist;
import javax.persistence.PostRemove;
import javax.persistence.PostUpdate;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;

public class AuditListener {
    static final Logger LOGGER = LogManager.getRootLogger();

    @PrePersist
    @PreUpdate
    @PreRemove
    public void beforeAnyUpdate(Object entity) {
        LOGGER.info("[AUDIT] About to update/delete entity: {} ", entity);
    }

    @PostPersist
    @PostUpdate
    @PostRemove
    public void afterAnyUpdate(Object entity) {
        LOGGER.info("[AUDIT] add/update/delete complete for entity: {}", entity);
    }

    @PostLoad
    public void afterLoad(Object entity) {
        LOGGER.info("[AUDIT] entity loaded from database: {}", entity);
    }
}