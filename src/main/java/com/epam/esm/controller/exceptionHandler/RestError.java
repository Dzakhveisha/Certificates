package com.epam.esm.controller.exceptionHandler;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RestError {
    private String errorMessage;
    private Integer errorCode;
}
