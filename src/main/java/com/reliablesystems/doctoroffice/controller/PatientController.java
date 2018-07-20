package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.domain.Patient;
import com.reliablesystems.doctoroffice.core.exception.BackEndException;
import com.reliablesystems.doctoroffice.core.service.bloodtype.BloodTypeService;
import com.reliablesystems.doctoroffice.core.service.patient.PatientService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.patient.PatientTO;
import com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys;
import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;
import com.reliablesystems.doctoroffice.core.utils.common.StringUtil;
import com.reliablesystems.doctoroffice.core.utils.file.FileUtil;
import com.reliablesystems.doctoroffice.core.utils.patient.PatientUtil;
import com.reliablesystems.doctoroffice.util.form.DataTableUtil;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
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
            System.out.println("length = " + length);
            RequestDataTable requestDataTable = DataTableUtil.initRequestDataTable(length, NumberUtil.TEN_INT, NumberUtil.FIVE_INT);
            requestDataTable.setQ(StringUtil.EMPTY);
            int ofset = NumberUtil.add(NumberUtil.multiply(requestDataTable.getCurrentPage(), requestDataTable.getElementsByPage()), NumberUtil.ONE_INT).intValue();
            List<PatientTO> patientTOList = patientService.findAllPatients(NumberUtil.ZERO_INT, requestDataTable.getLength(), requestDataTable.getQ());
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

    /**
     * Method to upload an profil picture
     *
     * @param file File
     * @param patientId Patient id
     * @return The reponse
     */
    @RequestMapping(value = "/updoadPacientProfile", method = RequestMethod.POST, consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE })
    @ResponseBody
    public ApiResponse updoadPacientProfile(@RequestParam("file") MultipartFile file, @RequestParam("patientId") Long patientId) {
        try {
            // Validate profile picture
            if (file.isEmpty()) {
                throw new BackEndException("No se encontro archivo");
            }
            String fileName = file.getOriginalFilename();
            System.out.println("fileName = " + fileName);
            String extension = fileName.substring(fileName.lastIndexOf(StringUtil.DOT) + NumberUtil.ONE_INT);
            // Validate if extension is valid
            if (!Arrays.asList(ApplicationKeys.ARRAY_AVAILABLE_IMAGES_PROFILE).contains(extension)) {
                throw new BackEndException("Invalid extension, available extension: " + Arrays.asList(ApplicationKeys.ARRAY_AVAILABLE_IMAGES_PROFILE).toString());
            }
            String profilePictureDirectory = ApplicationKeys.PATH_SERVER_FILES + StringUtil.SLASH + ApplicationKeys.FOLDER_FILES + StringUtil.SLASH + ApplicationKeys.FOLDER_PATIENT + patientId + StringUtil.SLASH + ApplicationKeys.FOLDER_PATIENT_PROFILE_PICTURE;
            System.out.println("profilePictureDirectory = " + profilePictureDirectory);
            // Create folder if it does not exist
            FileUtil.createFolderIfNotExist(profilePictureDirectory);
            // Build the full path image
            String finalNameFile = StringUtil.SLASH + ApplicationKeys.FOLDER_PATIENT + patientId + StringUtil.DOT + extension;
            System.out.println("finalNameFile = " + finalNameFile);
            // Find patient
            Patient patient = patientService.findPatientById(patientId);
            // If patient has profile picture, delete phisically the image
            if (patient != null && !patient.getProfileImage().isEmpty()) {
                FileUtil.deleteFileByPath(patient.getProfileImage());
            }
            // Upload the file
            FileUtil.uploadFile(profilePictureDirectory + finalNameFile, file.getBytes());
            // Update profile picture in DB
            patientService.updateProfilePicturePath(patientId, profilePictureDirectory + finalNameFile);
            // Return response
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }
}
