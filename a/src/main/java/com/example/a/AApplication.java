package com.example.a;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan(basePackages = {"com.example.a.data"})
public class AApplication {

    public static void main(String[] args) {
        SpringApplication.run(AApplication.class, args);
    }

}
