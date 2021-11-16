package com.epam.esm.service.impl;

import com.epam.esm.dao.jdbc.impl.UserRepository;
import com.epam.esm.dao.model.User;
import com.epam.esm.service.UserService;
import com.epam.esm.service.mapper.Mapper;
import com.epam.esm.service.model.dto.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final Mapper<User, UserDto> dtoMapper;

    @Override
    public List<UserDto> findAll() {
        return userRepository.getAll()
                .stream()
                .map(dtoMapper::toDTO)
                .collect(Collectors.toList());
    }
}
