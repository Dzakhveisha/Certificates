package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.impl.UserDaoImpl;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.UserService;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDaoImpl userRepository;
    private final Mapper<User, UserDto> dtoMapper;

    @Override
    public List<UserDto> findAll() {
        return userRepository.listOfAll()
                .stream()
                .map(dtoMapper::toDTO)
                .collect(Collectors.toList());
    }
}
