package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.bloodtype.BloodTypeService;
import com.reliablesystems.doctoroffice.core.service.patient.PatientService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.patient.PatientTO;
import com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys;
import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;
import com.reliablesystems.doctoroffice.core.utils.common.StringUtil;
import com.reliablesystems.doctoroffice.core.utils.patient.PatientUtil;
import com.reliablesystems.doctoroffice.util.form.DataTableUtil;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    /**
     * Method to update a patient
     *
     * @param patientTO Patient data
     * @return ApiResponse
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public ApiResponse updatePatient(@RequestBody PatientTO patientTO) {
        try {
            patientService.updatePatient(patientTO);
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to delete a patient
     *
     * @param patientId Patient id
     * @return ApiResponse
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResponse deletePatient(@RequestParam("patientId") long patientId) {
        try {
            patientService.inactivePatient(patientId);
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    @RequestMapping(value = "/updoadPacientProfile", method = RequestMethod.POST, consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE })
    @ResponseBody
    public ApiResponse updoadPacientProfile(@RequestParam("file") MultipartFile file, @RequestParam("patientId") Long patientId) {
        String directory = ApplicationKeys.PATH_SERVER_FILES;
        return null;
    }
}
