package com.example.testjwt.JWTPackage.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {
    
    @RequestMapping(value = "/")
    public String indexPage(){
        return "index";
    }
}
