package com.epam.esm.controller.handler;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RestError {
    private String errorMessage;
    private Integer errorCode;
}
