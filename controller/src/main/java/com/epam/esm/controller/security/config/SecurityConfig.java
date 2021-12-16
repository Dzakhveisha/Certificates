package com.epam.esm.controller.security.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests(authorizeRequests -> {
                    //Allows to restrict access based on HttpServletRequest using RequestMatcher implementations (i.e. via URL patterns)
                    authorizeRequests
                            .antMatchers(HttpMethod.GET, "/api/v1/tags/mostUseful", "/api/v1/users/{\\d}/orders", "/api/v1/users/{\\d}/orders{\\d}", "/api/v1/users").hasRole("ADMIN");
                    authorizeRequests
                            .antMatchers(HttpMethod.POST, "/api/v1/certificates", "/api/v1/tags").hasRole("ADMIN");
                    authorizeRequests
                            .antMatchers(HttpMethod.POST, "/api/v1/users/{\\d}/orders").hasAnyRole("ADMIN", "USER");
                    authorizeRequests
                            .antMatchers(HttpMethod.DELETE, "/api/v1/certificates/{\\d}", "/api/v1/tags/v1/{\\d}").hasRole("ADMIN");
                  //  authorizeRequests
                  //          .antMatchers(HttpMethod.GET, "/api/v1/certificates", "api/v1/certificates/{\\d+}", "/api/v1/tags", "api/v1/tags/{\\d}", "/api/v1/signIn").permitAll();
                    authorizeRequests
                            .antMatchers(HttpMethod.POST, "/api/v1/signIn", "/api/v1/login").not().fullyAuthenticated();
                });
    } //анотации

}
