package com.example.a;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.Date;

@Data
public class Taco {
    private Long id;
    private Date createdAt;

    @NotNull
    @Size(min=5,message = "name must be at least 5 characters long")
    private String name;
    @Size(min=1,message = "You must choose at 1 least 1 ingredient")
    private List<Ingredient> ingredients;
}
