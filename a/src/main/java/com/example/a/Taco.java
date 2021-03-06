package com.example.a;

import lombok.Data;
import lombok.Generated;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

@Data
@Entity
public class Taco {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date createdAt;

    @NotNull
    @Size(min=5,message = "name must be at least 5 characters long")
    private String name;

    @ManyToMany(targetEntity = Ingredient.class)
    @Size(min=1,message = "You must choose at 1 least 1 ingredient")
    private List<Ingredient> ingredients = new ArrayList<>();;

    @PrePersist
    void createdAt(){this.createdAt = new Date();}
}
