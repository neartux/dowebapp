package com.reliablesystems.doctoroffice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/diary")
public class DiaryController {

    /**
     * Display the view of diary
     *
     * @param model The viewbag
     * @return The view
     */
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display(Model model) {
        return "pages/patient/patientList";
    }
}
