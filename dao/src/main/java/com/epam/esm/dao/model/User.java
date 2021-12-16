package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "users")
@NoArgsConstructor
@AllArgsConstructor
public class User extends BaseEntity {

    @Column
    private String name;

    @Column(name = "u_password")
    private String password;

    @Column(name = "role")
    private Long roleId;

    public User(Long id, String name, String password, Long roleId) {
        super(id);
        this.name = name;
        this.password = password;
        this.roleId = roleId;
    }
}
