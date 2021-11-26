package com.epam.esm.controller.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class Translator {

    private final ResourceBundleMessageSource messageSource;

    @Autowired
    Translator(ResourceBundleMessageSource messageSource) {
        this.messageSource = messageSource;
    }

    public String toLocale(String msgCode, Object... params) {
        Locale locale = LocaleContextHolder.getLocale();
        return messageSource.getMessage(msgCode, params, locale);
    }
}
