package com.epam.esm.dao.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrderId implements Serializable {
    private Long userId;
    private Long certificateId;
}
