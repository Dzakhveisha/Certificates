package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.UserDao;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.dao.model.User;
import com.epam.esm.dao.model.UserRole;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.UserDtoMapper;
import com.epam.esm.service.model.dto.UserDto;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith({MockitoExtension.class})
class UserServiceImplTest {

    private UserServiceImpl userService;
    @Mock
    private UserDao userDao;

    private static final UserDto[] USERS_DTO = {
            new UserDto(1L, "User1",  UserRole.USER,null),
            new UserDto(2L, "User2",  UserRole.USER,null),
            new UserDto(3L, "User3",  UserRole.USER,null)
    };

    private static final User[] USERS = {
            new User(1L, "User1", null, 1L),
            new User(2L, "User2", null, 1L),
            new User(3L, "User3", null, 1L)
    };

    @BeforeEach
    void before() {
        userService = new UserServiceImpl(userDao, new UserDtoMapper());
    }

    @Test
    void testFindAllShouldReturnAllTagsIfDbIsNotEmpty() {
        List<User> users = Arrays.asList(USERS);

        Mockito.when(userDao.findAll(1)).thenReturn(new PageOfEntities<>(1, 1, users));
        PageOfEntities<UserDto> all = userService.findAll(1);
        List<UserDto> actual = all.getPage();

        List<UserDto> usersDto = Arrays.asList(USERS_DTO);
        assertEquals(usersDto, actual);
    }

    @Test
    void testFindAllShouldReturnEmptyListIfDbIsEmpty() {
        List<User> users = Collections.emptyList();

        Mockito.when(userDao.findAll(1)).thenReturn(new PageOfEntities<>(1, 1, users));
        PageOfEntities<UserDto> all = userService.findAll(1);
        List<UserDto> actual = all.getPage();

        assertTrue(actual.isEmpty());
    }

    @Test
    void testFindByIdShouldReturnUserWithSuchId() {
        User user = USERS[0];

        Mockito.when(userDao.findById(1L)).thenReturn(Optional.of(user));
        UserDto actual = userService.findById(1L);

        UserDto userDto = USERS_DTO[0];
        assertEquals(userDto, actual);
    }

    @Test
    void testFindByIdShouldThrowEntityNotFoundException() {
        Mockito.when(userDao.findById(199L)).thenReturn(Optional.empty());
        assertThrows(EntityNotFoundException.class, () -> userService.findById(199L));
    }
}