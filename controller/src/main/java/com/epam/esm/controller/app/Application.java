package com.epam.esm.controller.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication(scanBasePackages = {"com.epam.esm.**"}) // то же, что и @Configuration @EnableAutoConfiguration @ComponentScan
@EntityScan("com.epam.esm.dao.model")
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(new Class[]{Application.class}, args);
    }

}