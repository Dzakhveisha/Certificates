package com.epam.esm.service.mapper;

import com.epam.esm.dao.model.Order;
import com.epam.esm.service.model.dto.OrderDto;
import org.springframework.stereotype.Component;

@Component
public class OrderDtoMapper implements Mapper<Order, OrderDto> {
    @Override
    public Order toEntity(OrderDto dtoEntity) {
        return  new Order(dtoEntity.getUserId(), dtoEntity.getCertificateId(),
                dtoEntity.getPrice(), dtoEntity.getDate());
    }

    @Override
    public OrderDto toDTO(Order entity) {
        return new OrderDto(entity.getUserId(), entity.getCertificateId(),
                entity.getPrice(), entity.getDate());
    }
}
