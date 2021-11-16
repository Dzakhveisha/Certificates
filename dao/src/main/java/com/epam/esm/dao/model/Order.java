package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order{

    @Id
    @Column(name = "user_id")
    private Long userId;

    @Id
    @Column(name = "certificate_id")
    private Long certificateId;

    @Column(name = "price")
    private long price;

    @Column(name = "date")
    private LocalDateTime date;

}
