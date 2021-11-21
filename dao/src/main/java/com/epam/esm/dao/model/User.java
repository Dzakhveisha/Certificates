package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "users")
@NoArgsConstructor
@AllArgsConstructor
public class User extends BaseEntity {

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "user")
    List<Order> orders;

    public User(Long id, String name) {
        super(id);
        this.name = name;
    }
}
