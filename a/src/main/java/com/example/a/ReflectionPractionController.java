package com.example.a;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReflectionPractionController
{
    @RequestMapping("/ReflectionPraction")
    public String say(){


        return introductClass();
    }

    //
    public String introductClass(){
        Class cls1 = String.class;
        String name1 = cls1.getName();

        String s = "Hello";
        Class cls2 = s.getClass();
        String name2 = cls2.getName();

        Class cls3 = null;
        try {
            cls3 = Class.forName("java.lang.String");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String name3 = cls3.getName();

        StringBuilder sb = new StringBuilder(1024);
        sb.append(name1);
        sb.append("\n");
        sb.append(name2);
        sb.append("\n");
        sb.append(name3);
        System.out.println(sb.toString());
        return sb.toString();
    }


}

class Person {
    public String name;
}
