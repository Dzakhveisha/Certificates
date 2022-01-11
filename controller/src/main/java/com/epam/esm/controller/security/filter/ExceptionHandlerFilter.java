package com.epam.esm.controller.security.filter;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.epam.esm.controller.security.config.SecurityErrorHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.AccessDeniedException;


@Component
@RequiredArgsConstructor
public class ExceptionHandlerFilter extends OncePerRequestFilter {
    private final SecurityErrorHandler handler;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            filterChain.doFilter(request, response);
        } catch (TokenExpiredException e) {
            handler.sendError(HttpStatus.FORBIDDEN, "-08", response);
        } catch (JWTVerificationException e) {
            handler.sendError(HttpStatus.UNAUTHORIZED, "-07", response);
        } catch (AccessDeniedException e) {
            handler.sendError(HttpStatus.FORBIDDEN, "-05", response);
        }catch (FilterException e){
            handler.sendError(HttpStatus.METHOD_NOT_ALLOWED , "", response);
        }

    }
}