package com.epam.esm.controller.security;

import com.epam.esm.service.UserService;
import com.epam.esm.service.exception.EntityNotFoundException;
import com.epam.esm.service.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SecurityService implements UserDetailsService {

    private UserService userService;

    public UserDetails loadUserByUsername(String username) throws EntityNotFoundException {
        UserDto user = userService.findByName(username);
        return UserDetailsMapper.mapToUserDetails(user);
    }
}

