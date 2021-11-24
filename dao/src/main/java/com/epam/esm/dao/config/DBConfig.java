package com.epam.esm.dao.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.epam.esm")
public class DBConfig {

    @Value("#{environment.DB_PASSWORD}")
    private String dbPassword;

    @Value("#{environment.DB_USER_NAME}")
    private String dbUserName;

    @Autowired
    @Bean
    public JdbcTemplate getTemplate(DataSource dataSource) {

        return new JdbcTemplate(dataSource);
    }

    @Bean
    @Profile("prod")
    public HikariDataSource hikariDataSource() {
        HikariConfig config = new HikariConfig();
        config.setUsername(dbUserName);
        config.setPassword(dbPassword);
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setJdbcUrl("jdbc:mysql://localhost:3306/epam_certificates?serverTimezone=UTC");
        config.addDataSourceProperty("databaseName", "epam_certificates");
        config.addDataSourceProperty("serverName", "127.0.0.1");
        return new HikariDataSource(config);
    }

    @Bean
    @Profile("dev")
    public DataSource embeddedDataSource() {
        return new EmbeddedDatabaseBuilder()
                .setType(EmbeddedDatabaseType.H2)
                .addScript("/createDB.sql")
                .build();
    }
}