package com.epam.esm.service.impl;

import com.epam.esm.dao.jpa.UserRepository;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.dao.model.User;
import com.epam.esm.dao.model.UserRole;
import com.epam.esm.service.UserService;
import com.epam.esm.service.exception.ArgumentNotValidException;
import com.epam.esm.service.exception.EntityAlreadyExistException;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final Mapper<User, UserDto> userDtoMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public Page<UserDto> findAll(int pageNumber) {
        Page<User> userPage = userRepository.findAll(PageRequest.of(pageNumber - 1, 10));
        return userPage.map(userDtoMapper::toDTO);
    }

    @Override
    public UserDto findById(Long userId) {
        return userRepository.findById(userId)
                .map(userDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("User", userId));
    }


    @Override
    public UserDto findByName(String username) throws UsernameNotFoundException {
        return userRepository.findByName(username)
                .map(userDtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("User"));
    }

    @Override
    @Transactional
    public UserDto register(UserDto user) {
        if(user.getName() == null || user.getPassword() == null){
            throw new ArgumentNotValidException("Not enough parameters!");
        }
        Optional<User> userOptional = userRepository.findByName(user.getName());
        if (userOptional.isPresent()) {
            throw new EntityAlreadyExistException(user.getName(), "User");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(UserRole.USER);
        return userDtoMapper.toDTO(
                userRepository.save(userDtoMapper.toEntity(user))
        );
    }
}
