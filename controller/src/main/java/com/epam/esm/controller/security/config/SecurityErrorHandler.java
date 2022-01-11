package com.epam.esm.controller.security.config;

import com.epam.esm.controller.config.Translator;
import com.epam.esm.controller.handler.RestError;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@RequiredArgsConstructor
public class SecurityErrorHandler implements AuthenticationFailureHandler, AuthenticationEntryPoint, AccessDeniedHandler {

    private final ObjectMapper objectMapper;
    private final Translator translator;

    @Override  // неудачная попытка входа
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException {
        sendError(HttpStatus.UNAUTHORIZED, "-04", response);
    }

    @Override      // для неавторизованных
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException {
        sendError(HttpStatus.FORBIDDEN, "-05", response);
    }

    @Override //Исключение отказа в доступе
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException {
        sendError(HttpStatus.FORBIDDEN, "-06", response);
    }

    public void sendError(HttpStatus status, String code, HttpServletResponse response) throws IOException {
        String localizedMessage = translator.toLocale(status.value() + code);
        RestError restError = new RestError(localizedMessage, status, code);
        response.setCharacterEncoding("UTF-8");
        response.setStatus(status.value());
        response.setContentType(MediaType.APPLICATION_JSON_VALUE + "; charset=UTF-8");
        String errorResponseString = objectMapper.writeValueAsString(restError);
        response.getWriter().print(errorResponseString);
    }
}
