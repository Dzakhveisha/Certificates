package com.epam.esm.dao.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "orders")
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "certificate_id")
    private Certificate certificate;

    @Column(name = "price")
    private long price;

    @Column(name = "date")
    private LocalDateTime date;

    public Order(User user, Certificate certificate, long price, LocalDateTime date) {
        this.user = user;
        this.certificate = certificate;
        this.price = price;
        this.date = date;
    }
}
