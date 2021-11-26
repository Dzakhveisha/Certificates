package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.impl.UserDaoImpl;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.UserService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDaoImpl userDao;
    private final Mapper<User, UserDto> userDtoMapper;

    @Override
    public List<UserDto> findAll(int pageNumber) {
        return userDao.listOfAll(pageNumber)
                .stream()
                .map(userDtoMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public UserDto getById(Long userId) {
        return userDao.getById(userId)
                .map(userDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("User", userId));
    }
}
