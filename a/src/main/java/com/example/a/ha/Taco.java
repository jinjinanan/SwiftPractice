package com.example.a.ha;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Data
public class Taco {
    @NotNull
    @Size(min=5,message = "name must be at least 5 characters long")
    private String name;
    @Size(min=1,message = "You must choose at 1 least 1 ingredient")
    private List<String> ingredients;
}
