package com.epam.esm.service.mapper;

import com.epam.esm.dao.model.Order;
import com.epam.esm.service.model.dto.OrderDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class OrderDtoMapper implements Mapper<Order, OrderDto> {

    @Override
    public Order toEntity(OrderDto dtoEntity) {
        if (dtoEntity == null) {
            return null;
        }
        return new Order(dtoEntity.getId(), null, null, dtoEntity.getPrice(), dtoEntity.getDate());
    }

    @Override
    public OrderDto toDTO(Order entity) {
        if (entity == null) {
            return null;
        }
        return new OrderDto(entity.getId(), entity.getUser().getId(), entity.getCertificate().getId(),
                entity.getPrice(), entity.getDate());
    }
}
