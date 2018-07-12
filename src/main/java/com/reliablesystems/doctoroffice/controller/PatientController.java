package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.patient.PatientTO;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/patient")
public class PatientController {

    /**
     * Display the view of list of patients
     *
     * @param model The viewbag
     * @return The view
     */
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display(Model model) {
        System.out.println("HER IN CONTROLLER");
        return "pages/patient/patientList";
    }

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse findAllPatient() {
        try {
            RequestDataTable req = new RequestDataTable();
            req.setLength(100);
            req.setNumPages(10);
            req.setCurrentPage(2);
            req.setElementsByPage(15);
            req.setPagesToDisplay(5);


            PatientTO patient1 = new PatientTO();
            patient1.setId(1L);
            patient1.setFirstName("Ricardo");
            patient1.setLastName("Dzul");
            patient1.setSex("H");
            patient1.setAddress("Centro Acanceh");
            patient1.setPhone("9993599516");
            patient1.setEmail("rdzul@gmail.com");

            PatientTO patient2 = new PatientTO();
            patient2.setId(1L);
            patient2.setFirstName("Ricardo");
            patient2.setLastName("Dzul");
            patient2.setSex("H");
            patient2.setAddress("Centro Acanceh");
            patient2.setPhone("9993599516");
            patient2.setEmail("rdzul@gmail.com");


            PatientTO patient3 = new PatientTO();
            patient3.setId(1L);
            patient3.setFirstName("Ricardo");
            patient3.setLastName("Dzul");
            patient3.setSex("H");
            patient3.setAddress("Centro Acanceh");
            patient3.setPhone("9993599516");
            patient3.setEmail("rdzul@gmail.com");



            PatientTO patient4 = new PatientTO();
            patient4.setId(1L);
            patient4.setFirstName("Ricardo");
            patient4.setLastName("Dzul");
            patient4.setSex("H");
            patient4.setAddress("Centro Acanceh");
            patient4.setPhone("9993599516");
            patient4.setEmail("rdzul@gmail.com");


            PatientTO patient5 = new PatientTO();
            patient5.setId(1L);
            patient5.setFirstName("Ricardo");
            patient5.setLastName("Dzul");
            patient5.setSex("H");
            patient5.setAddress("Centro Acanceh");
            patient5.setPhone("9993599516");
            patient5.setEmail("rdzul@gmail.com");

            List<PatientTO> list = new ArrayList<>();
            list.add(patient1);
            list.add(patient2);
            list.add(patient3);
            list.add(patient4);
            list.add(patient5);

            req.setData(list);

            return new ApiResponse(false, req);


        } catch (Exception e) {
            return new ApiResponse(true, e.getMessage());
        }
    }
}
