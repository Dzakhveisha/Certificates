package com.epam.esm.service.mapper;

import com.epam.esm.dao.model.User;
import com.epam.esm.service.model.dto.UserDto;
import org.springframework.stereotype.Component;

@Component
public class UserDtoMapper implements Mapper<User, UserDto>{
    @Override
    public User toEntity(UserDto dtoEntity) {
        return new User(dtoEntity.getId(), dtoEntity.getName());
    }

    @Override
    public UserDto toDTO(User entity) {
        return new UserDto(entity.getId(), entity.getName());
    }
}
