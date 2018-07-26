package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.doctor.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;

    /**
     * Display the view of list of doctors
     *
     * @return The view
     */
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display() {
        return "pages/doctor/doctorList";
    }
}
