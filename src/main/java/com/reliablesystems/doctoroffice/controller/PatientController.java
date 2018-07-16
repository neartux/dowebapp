package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.patient.PatientService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.patient.PatientTO;
import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;
import com.reliablesystems.doctoroffice.core.utils.common.StringUtil;
import com.reliablesystems.doctoroffice.util.form.DataTableUtil;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping(value = "/patient")
public class PatientController {
    @Autowired
    private PatientService patientService;

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
            int length = patientService.finAllPatientsCount(StringUtil.EMPTY);
            RequestDataTable requestDataTable = DataTableUtil.initRequestDataTable(length, NumberUtil.TEN_INT, NumberUtil.FIVE_INT);
            requestDataTable.setQ(StringUtil.EMPTY);
            int ofset = NumberUtil.add(NumberUtil.multiply(requestDataTable.getCurrentPage(), requestDataTable.getElementsByPage()), NumberUtil.ONE_INT).intValue();
            System.out.println("ofset = " + ofset);
            List<PatientTO> patientTOList = patientService.findAllPatients(ofset, requestDataTable.getLength(), requestDataTable.getQ());
            requestDataTable.setData(patientTOList);

            return new ApiResponse(false, requestDataTable);


        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse findAllPatient(@RequestBody RequestDataTable requestDataTable) {
        try {
            int length = patientService.finAllPatientsCount(StringUtil.EMPTY);
            requestDataTable.setLength(length);
            int ofset = NumberUtil.add(NumberUtil.multiply(requestDataTable.getCurrentPage(), requestDataTable.getElementsByPage()), NumberUtil.ONE_INT).intValue();
            System.out.println("ofset = " + ofset);
            requestDataTable = DataTableUtil.recalculatePageNumberRequestDataTable(requestDataTable);
            List<PatientTO> patientTOList = patientService.findAllPatients(ofset, requestDataTable.getLength(), requestDataTable.getQ());
            requestDataTable.setData(patientTOList);

            return new ApiResponse(false, requestDataTable);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }
}
