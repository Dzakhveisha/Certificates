package com.epam.esm.handler;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RestError {
    private String errorMessage;
    private Integer errorCode;
}
