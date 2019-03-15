package com.shop.computer.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewsController {

    @GetMapping("/")
    public String showHomepage() { return "index"; }

    @GetMapping("/logowanie")
    public String showLogin() { return "login"; }

}
