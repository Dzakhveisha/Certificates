package com.epam.esm.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.epam.esm")
@PropertySource("classpath:db.properties")
public class DBConfig {

    private DataSource dataSource;

    @Autowired
    @Bean
    public JdbcTemplate getTemplate(DataSource dataSource) {

        return new JdbcTemplate(dataSource);
    }

    @Bean
    @Profile("prod")
    public HikariDataSource HikariDataSource(){
        /*HikariConfig config = new HikariConfig("/db.properties");
        return new HikariDataSource(config);*/

        HikariConfig config = new HikariConfig();
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setJdbcUrl("jdbc:mysql://localhost:3306/epam_certificates?serverTimezone=UTC");
        config.setUsername("root");
        config.setPassword("mysqlPassword");
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
