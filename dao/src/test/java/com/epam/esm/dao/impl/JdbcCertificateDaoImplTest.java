package com.epam.esm.dao.impl;

import com.epam.esm.config.DBConfig;
import com.epam.esm.model.Certificate;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.assertNotNull;


@ActiveProfiles("dev")
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {DBConfig.class})
class JdbcCertificateDaoImplTest {

    @Autowired
    private JdbcCertificateDaoImpl certificateDao;


    @Test
    void getEntityById() {
        Certificate actual = certificateDao.getEntityById(1L).get();
        assertNotNull(actual);
    }

}