package com.epam.esm.service.mapper;

import com.epam.esm.dao.model.User;
import com.epam.esm.dao.model.UserRole;
import com.epam.esm.service.model.dto.UserDto;
import org.springframework.stereotype.Component;

@Component
public class UserDtoMapper implements Mapper<User, UserDto>{
    @Override
    public User toEntity(UserDto dtoEntity) {
        if (dtoEntity == null) {
            return null;
        }
        return new User(dtoEntity.getId(), dtoEntity.getName(), dtoEntity.getPassword(), dtoEntity.getRole().getRoleNumber());
    }

    @Override
    public UserDto toDTO(User entity) {
        if (entity == null) {
            return null;
        }
        return new UserDto(entity.getId(), entity.getName(), UserRole.getRoleByLong(entity.getRoleId()), entity.getPassword());
    }
}
