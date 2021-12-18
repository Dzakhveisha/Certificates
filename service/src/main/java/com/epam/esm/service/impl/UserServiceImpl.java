package com.epam.esm.service.impl;

import ch.qos.logback.core.encoder.EchoEncoder;
import com.epam.esm.dao.jpa.UserDao;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.dao.model.User;
import com.epam.esm.dao.model.UserRole;
import com.epam.esm.service.UserService;
import com.epam.esm.service.exception.EntityAlreadyExistException;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDao userDao;
    private final Mapper<User, UserDto> userDtoMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public PageOfEntities<UserDto> findAll(int pageNumber) {
        PageOfEntities<User> userPage = userDao.findAll(pageNumber);
        List<UserDto> usersDto = userPage.getPage()
                .stream()
                .map(userDtoMapper::toDTO)
                .collect(Collectors.toList());
        return new PageOfEntities<>(userPage.getCountOfPages(), userPage.getPageNumber(), usersDto);
    }

    @Override
    public UserDto findById(Long userId) {
        return userDao.findById(userId)
                .map(userDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("User", userId));
    }


    @Override
    public UserDto findByName(String username) throws UsernameNotFoundException {
        return userDao.findByName(username)
                .map(userDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("User"));
    }

    @Override
    @Transactional
    public UserDto register(UserDto user) {
        Optional<User> userOptional = userDao.findByName(user.getName());
        if (userOptional.isPresent()) {
            throw new EntityAlreadyExistException(user.getName(), "Certificate");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(UserRole.USER);
        return userDtoMapper.toDTO(
                userDao.create(userDtoMapper.toEntity(user))
        );
    }
}
