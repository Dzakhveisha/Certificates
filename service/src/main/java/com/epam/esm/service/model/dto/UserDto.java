package com.epam.esm.service.model.dto;

import com.epam.esm.dao.model.UserRole;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto extends RepresentationModel<UserDto> {
    private Long id;

    @NotNull
    @Size(min = 1)
    private String name;

    private UserRole role;

    @NotNull
    private String password;

    public UserDto(String name, String password) {
        this.name = name;
        this.password = password;
        this.role = UserRole.USER;
    }
}
