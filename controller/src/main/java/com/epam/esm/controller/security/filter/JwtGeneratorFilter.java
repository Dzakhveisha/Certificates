package com.epam.esm.controller.security.filter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.epam.esm.controller.security.CustomUserDetails;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.exception.ArgumentNotValidException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.HttpRequestMethodNotSupportedException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@Slf4j
public class JwtGeneratorFilter extends UsernamePasswordAuthenticationFilter {

    private final ObjectMapper objectMapper;

    public JwtGeneratorFilter(ObjectMapper objectMapper, AuthenticationManager authenticationManager, AuthenticationFailureHandler authenticationFailureHandler) {
        setAuthenticationManager(authenticationManager);
        setAuthenticationFailureHandler(authenticationFailureHandler);
        this.objectMapper = objectMapper;
    }

    @SneakyThrows
    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        if (request.getMethod().equals("POST")) {
            User user = new User();
            ObjectMapper mapper = new ObjectMapper();
            try {
                user = mapper.readValue(request.getInputStream(), User.class);
            } catch (IOException e) {
                throw new ArgumentNotValidException("");
            }
            log.info("Username is : {}", user.getName());
            log.info("password is : {}", user.getPassword());
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(user.getName(), user.getPassword());
            return getAuthenticationManager().authenticate(authenticationToken);
        } else {
            throw new FilterException("Unsupported method!");
        }
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        log.info("User has been successfully authenticated");
        CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
        Algorithm algorithm = Algorithm.HMAC256("secret".getBytes(StandardCharsets.UTF_8));
        Instant accessTokenExpiresAt = OffsetDateTime.now().plusMinutes(60).toInstant();
        String accessToken = JWT.create()
                .withSubject(user.getUsername())
                .withExpiresAt(new Date(accessTokenExpiresAt.toEpochMilli()))
                .withIssuer(request.getRequestURL().toString())
                .withClaim("role", user.getAuthority())
                .sign(algorithm);
        Map<String, String> tokens = new HashMap<>();
        tokens.put("access_token", accessToken);
        response.setContentType(APPLICATION_JSON_VALUE);
        objectMapper.writeValue(response.getOutputStream(), tokens);
    }
}
