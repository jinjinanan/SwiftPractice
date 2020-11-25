package com.example.a.web;

import com.example.a.Ingredient;
import com.example.a.Taco;
import com.example.a.Order;
import com.example.a.Ingredient.Type;

import com.example.a.data.IngredientRepository;
import com.example.a.data.TacoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.example.a.data.IngredientRepository;

@Slf4j
@Controller
@RequestMapping("/design")
@SessionAttributes("order")
public class DesignTacoController {

    private final IngredientRepository ingredientRepo;
    private TacoRepository designRepo;

    @Autowired
    public DesignTacoController(
            IngredientRepository ingredientRepo,
            TacoRepository designRepo
    )
    {
        this.designRepo = designRepo;
        this.ingredientRepo = ingredientRepo;
    }

    @ModelAttribute(name = "order")
    public Order order() {return new Order();}

    @ModelAttribute(name = "taco")
    public Taco taco() {return new Taco();}

    @GetMapping
    public String showDesignForm(Model model){
        List<Ingredient> ingredientList = new ArrayList<>();
        ingredientRepo.findAll().forEach(i -> ingredientList.add(i));
        Type[] types = Ingredient.Type.values();
        for (Type type : types){
            model.addAttribute(type.toString().toLowerCase(),filterByType(ingredientList,type));
        }

        return "design";
    }

    @PostMapping
    public String processDesign(@Valid Taco design, Errors errors,@ModelAttribute Order order){
        if (errors.hasErrors())
        {
            return "design";
        }
        log.info("processing design:"+design);
        Taco taco = designRepo.save(design);
        order.addDesign(taco);
        return "redirect:/orders/current";
    }

    private List<Ingredient> filterByType(
            List<Ingredient> ingredients, Type type) {
        return ingredients
                .stream()
                .filter(x -> x.getType().equals(type))
                .collect(Collectors.toList());
    }
}
