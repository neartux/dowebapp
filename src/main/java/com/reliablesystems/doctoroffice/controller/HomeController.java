package com.reliablesystems.doctoroffice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display(Model model) {
        System.out.println("HER IN CONTROLLER");
        model.addAttribute("hello", "My first vieww");
        return "pages/home/home";
    }
}
