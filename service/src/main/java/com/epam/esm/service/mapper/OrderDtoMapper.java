package com.epam.esm.service.mapper;

import com.epam.esm.dao.jpa.CertificateDao;
import com.epam.esm.dao.jpa.UserDao;
import com.epam.esm.dao.model.Order;
import com.epam.esm.service.exception.CertificateNotFoundException;
import com.epam.esm.service.exception.UserNotFoundException;
import com.epam.esm.service.model.dto.OrderDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class OrderDtoMapper implements Mapper<Order, OrderDto> {

    private final CertificateDao certificateService;
    private final UserDao userService;

    @Override
    public Order toEntity(OrderDto dtoEntity) {
        if (dtoEntity == null) {
            return null;
        }
        return new Order(dtoEntity.getId(), userService.getById(dtoEntity.getUserId())
                .orElseThrow(() -> new UserNotFoundException(dtoEntity.getUserId())),
                certificateService.getEntityById(dtoEntity.getCertificateId())
                        .orElseThrow(() -> new CertificateNotFoundException(dtoEntity.getUserId())),
                dtoEntity.getPrice(), dtoEntity.getDate());
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
