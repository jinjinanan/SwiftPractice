package com.example.a;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

//@RestController是@ResponseBody ＋ @Controller合体，
//当你在这个controller中方法只是想返回一个页面时，就不能用@RestController,因为它会把你的返回值当作数据返回，而不是页面名字，所以这时候就只能用@Controller。
@RestController
public class HomeController {
//    @GetMapping是一个组合注解，是@RequestMapping(method = RequestMethod.GET)的缩写
    @GetMapping("/")
    public String home(){
        return "home";
    }
}
