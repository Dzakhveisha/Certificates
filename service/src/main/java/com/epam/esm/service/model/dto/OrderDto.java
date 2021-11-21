package com.epam.esm.service.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {
    private Long id;

    private Long userId;

    @NotNull
    private Long certificateId;

    private long price;

    private LocalDateTime date;
}
