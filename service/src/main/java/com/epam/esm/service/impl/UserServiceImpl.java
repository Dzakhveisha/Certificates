package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.UserDao;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.UserService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDao userDao;
    private final Mapper<User, UserDto> userDtoMapper;

    @Override
    public PageOfEntities<UserDto> findAll(int pageNumber) {
        PageOfEntities<User> userPage = userDao.listOf(pageNumber);
        return new PageOfEntities<>(userPage.getCountOfPages(), userPage.getCurPageNumber(),
                userPage.getCurPage()
                        .stream()
                        .map(userDtoMapper::toDTO)
                        .collect(Collectors.toList()));
    }

    @Override
    public UserDto getById(Long userId) {
        return userDao.getById(userId)
                .map(userDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("User", userId));
    }
}
