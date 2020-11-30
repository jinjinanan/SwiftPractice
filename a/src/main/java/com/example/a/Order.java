package com.example.a;

import lombok.Data;
import org.hibernate.validator.constraints.CreditCardNumber;

import javax.persistence.*;
import javax.sound.sampled.TargetDataLine;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Data
@Entity
@Table(name = "Taco_Order")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date placedAt;

    @ManyToOne
    private User user;

    @NotBlank(message = "Name is required")
    private String deliveryName;
    @NotBlank(message = "street is required")
    private String deliveryStreet;
    @NotBlank(message = "city is required")
    private String deliveryCity;
    @NotBlank(message = "state is required")
    private String deliveryState;
    @NotBlank(message = "zip is required")
    private String deliveryZip;
    @CreditCardNumber(message = "Not a valid credit card number")
    private String ccNumber;
    @Pattern(regexp = "^(0[1-9]|1[0-2])([\\/])([1-9][0-9])$",message = "Must be formatted MM/YY")
    private String ccExpiration;
    @Digits(integer = 3,fraction = 0,message = "Invalid CVV")
    private String ccCVV;

    @ManyToMany(targetEntity = Taco.class)
    private List<Taco> tacos = new ArrayList<>();

    public void addDesign(Taco design){this.tacos.add(design);}

    @PrePersist
    void placedAt() {this.placedAt = new Date();}

}
