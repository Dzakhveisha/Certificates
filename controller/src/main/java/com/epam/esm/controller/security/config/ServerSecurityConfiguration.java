package com.epam.esm.controller.security.config;

import com.epam.esm.controller.security.filter.ExceptionHandlerFilter;
import com.epam.esm.controller.security.filter.JwtCheckerFilter;
import com.epam.esm.controller.security.filter.JwtGeneratorFilter;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.filter.CorsFilter;

import static org.springframework.security.config.http.SessionCreationPolicy.STATELESS;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalMethodSecurity(
        prePostEnabled = true,
        securedEnabled = true,
        jsr250Enabled = true)
public class ServerSecurityConfiguration extends WebSecurityConfigurerAdapter {

    private final PasswordEncoder passwordEncoder;
    private final UserDetailsService userService;
    private JwtCheckerFilter jwtCheckerFilter;
    private JwtGeneratorFilter authenticationFilter;
    private final SecurityErrorHandler securityErrorHandler;
    private final ExceptionHandlerFilter exceptionHandlerFilter;

    @Value("${spring.mvc.servlet.path}")
    private String SERVLET_PATH;

    @Bean
    public JwtGeneratorFilter authenticationFilter(AuthenticationManager manager, ObjectMapper objectMapper) {
        authenticationFilter = new JwtGeneratorFilter(objectMapper, manager, securityErrorHandler);
        authenticationFilter.setFilterProcessesUrl(SERVLET_PATH + "/login");
        return authenticationFilter;
    }

    @Bean
    public JwtCheckerFilter authorizationFilter(ObjectMapper objectMapper) {
        jwtCheckerFilter = new JwtCheckerFilter(objectMapper, userDetailsService());
        return jwtCheckerFilter;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .httpBasic().disable()
                .csrf().disable()
                .sessionManagement().sessionCreationPolicy(STATELESS)
                .and()
                .exceptionHandling()
                .accessDeniedHandler(securityErrorHandler)
                .authenticationEntryPoint(securityErrorHandler)
                .and().formLogin().failureHandler(securityErrorHandler)
                .and()
                .addFilter(authenticationFilter)
                .addFilterAfter(jwtCheckerFilter, JwtGeneratorFilter.class)
                .addFilterBefore(exceptionHandlerFilter, CorsFilter.class);
    }

    @Bean
    public AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }


}
