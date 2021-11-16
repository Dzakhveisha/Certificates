package com.epam.esm.service.model.dto;

import com.epam.esm.service.mapper.Mapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {
    private Long userId;

    private Long certificateId;

    private long price;

    private LocalDateTime date;
}
