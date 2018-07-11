package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.domain.LocationData;
import com.reliablesystems.doctoroffice.core.domain.Patient;
import com.reliablesystems.doctoroffice.core.domain.PersonalData;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
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
            Patient patient1 = new Patient();
            patient1.setId(1L);
            PersonalData personalData1 = new PersonalData();
            personalData1.setFirstName("Ricardo");
            personalData1.setLastName("Dzul");
            personalData1.setSex("H");
            patient1.setPersonalData(personalData1);
            LocationData locationData = new LocationData();
            locationData.setAddress("Centro Acanceh");
            locationData.setPhone("9993599516");
            locationData.setEmail("rdzul@gmail.com");
            patient1.setLocationData(locationData);

            Patient patient2 = new Patient();
            patient2.setId(1L);
            PersonalData personalData2 = new PersonalData();
            personalData2.setFirstName("Ricardo");
            personalData2.setLastName("Dzul");
            personalData2.setSex("H");
            patient2.setPersonalData(personalData2);
            LocationData locationData2 = new LocationData();
            locationData2.setAddress("Centro Acanceh");
            locationData2.setPhone("9993599516");
            locationData2.setEmail("rdzul@gmail.com");
            patient2.setLocationData(locationData2);


            Patient patient3 = new Patient();
            patient3.setId(1L);
            PersonalData personalData3 = new PersonalData();
            personalData3.setFirstName("Ricardo");
            personalData3.setLastName("Dzul");
            personalData3.setSex("H");
            patient3.setPersonalData(personalData3);
            LocationData locationData3 = new LocationData();
            locationData3.setAddress("Centro Acanceh");
            locationData3.setPhone("9993599516");
            locationData3.setEmail("rdzul@gmail.com");
            patient3.setLocationData(locationData3);



            Patient patient4 = new Patient();
            patient4.setId(1L);
            PersonalData personalData4 = new PersonalData();
            personalData4.setFirstName("Ricardo");
            personalData4.setLastName("Dzul");
            personalData4.setSex("H");
            patient4.setPersonalData(personalData4);
            LocationData locationData4 = new LocationData();
            locationData4.setAddress("Centro Acanceh");
            locationData4.setPhone("9993599516");
            locationData4.setEmail("rdzul@gmail.com");
            patient4.setLocationData(locationData4);


            Patient patient5 = new Patient();
            patient5.setId(1L);
            PersonalData personalData5 = new PersonalData();
            personalData5.setFirstName("Ricardo");
            personalData5.setLastName("Dzul");
            personalData5.setSex("H");
            patient5.setPersonalData(personalData5);
            LocationData locationData5 = new LocationData();
            locationData5.setAddress("Centro Acanceh");
            locationData5.setPhone("9993599516");
            locationData5.setEmail("rdzul@gmail.com");
            patient5.setLocationData(locationData5);

            List<Patient> list = new ArrayList<>();
            list.add(patient1);
            list.add(patient2);
            list.add(patient3);
            list.add(patient4);
            list.add(patient5);

            return new ApiResponse(false, list);


        } catch (Exception e) {
            return new ApiResponse(true, e.getMessage());
        }
    }
}
