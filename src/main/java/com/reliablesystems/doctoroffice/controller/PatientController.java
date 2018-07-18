package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.bloodtype.BloodTypeService;
import com.reliablesystems.doctoroffice.core.service.patient.PatientService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.patient.PatientTO;
import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;
import com.reliablesystems.doctoroffice.core.utils.common.StringUtil;
import com.reliablesystems.doctoroffice.core.utils.patient.PatientUtil;
import com.reliablesystems.doctoroffice.util.form.DataTableUtil;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/patient")
public class PatientController {
    @Autowired
    private PatientService patientService;
    @Autowired
    private BloodTypeService bloodTypeService;

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

    /**
     * Method to find all blood types in the system
     *
     * @return List of BloodType
     */
    @RequestMapping(value = "/findBloodTypes", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse findBloodTypes() {
        try {
            return new ApiResponse(false, bloodTypeService.findAllBloodTypes());
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to find all patient, inicialize datatable values
     *
     * @return ApiResponse
     */
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

    /**
     * Method to reconfigure datatable values patient
     *
     * @param requestDataTable Data of datatable
     * @return ApiResponse
     */
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

    /**
     * Method to create a new patient
     *
     * @param patientTO Patient data
     * @return ApiResponse
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse createPatient(@RequestBody PatientTO patientTO) {
        try {
            Long idPatient = patientService.createPatient(PatientUtil.getPatientToCreate(patientTO));
            return new ApiResponse(false, idPatient);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }
}
