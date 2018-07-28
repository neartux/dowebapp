package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.domain.Doctor;
import com.reliablesystems.doctoroffice.core.exception.BackEndException;
import com.reliablesystems.doctoroffice.core.service.doctor.DoctorService;
import com.reliablesystems.doctoroffice.core.service.user.UserService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.doctor.DoctorTO;
import com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys;
import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;
import com.reliablesystems.doctoroffice.core.utils.common.StringUtil;
import com.reliablesystems.doctoroffice.core.utils.doctor.DoctorUtil;
import com.reliablesystems.doctoroffice.core.utils.file.FileUtil;
import com.reliablesystems.doctoroffice.util.common.CommonUtil;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;
import com.reliablesystems.doctoroffice.util.session.CompanySession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private UserService userService;

    /**
     * Display the view of list of doctors
     *
     * @return The view
     */
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display() {
        return "pages/doctor/doctorList";
    }

    /**
     * Method to find all doctors, inicialize datatable values
     *
     * @param requestDataTable Datatable data
     * @param request Client request
     * @return List of doctors
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse findDoctorsByCompany(@RequestBody RequestDataTable requestDataTable, HttpServletRequest request) {
        try {
            long companyId = CompanySession.getCompanyId(request);
            int length = doctorService.findDoctorsCountByCompany(companyId, requestDataTable.getSearch().get("value").toString());
            Map<String, Object> map = new HashMap<>();
            map.put("draw", requestDataTable.getDraw());
            map.put("recordsFiltered", length);
            map.put("recordsTotal", length);
            map.put("data", doctorService.findDoctorsByCompany(companyId, requestDataTable.getStart(), requestDataTable.getLength(), requestDataTable.getSearch().get("value").toString()));

            return new ApiResponse(false, map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to create a new doctor
     *
     * @param doctorTO Doctor data
     * @param request Client request
     * @return ApiResponse
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse createDoctor(@RequestBody DoctorTO doctorTO, HttpServletRequest request) {
        System.out.println("doctorTO.toString() = " + doctorTO.toString());
        try {
            // Set company
            doctorTO.setCompanyId(CompanySession.getCompanyId(request));
            // Set user
            doctorTO.setUserId(CompanySession.getUserId(request));
            Long doctorId = doctorService.createDoctor(DoctorUtil.getDoctorToCreate(doctorTO), doctorTO.getUserName(), doctorTO.getPassword());
            return new ApiResponse(false, doctorId);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to verify if username is valid
     *
     * @param username User name to valid
     * @return Response
     */
    @RequestMapping(value = "/existusername/{username}", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse existUserName(@PathVariable String username) {
        try {
            return new ApiResponse(false, userService.existUserByUserName(username));
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to update a doctor
     *
     * @param doctorTO Doctor data
     * @return ApiResponse
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public ApiResponse updateDoctor(@RequestBody DoctorTO doctorTO) {
        try {
            doctorService.updateDoctor(doctorTO);
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to delete a doctor
     *
     * @param doctorId Doctor id
     * @return ApiResponse response
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResponse deleteDoctor(@RequestParam("doctorId") long doctorId) {
        try {
            doctorService.inactiveDoctor(doctorId);
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to upload an profile picture
     *
     * @param file File
     * @param doctorId Doctor id
     * @return The reponse
     */
    @RequestMapping(value = "/updoadDoctorProfile", method = RequestMethod.POST, consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE })
    @ResponseBody
    public ApiResponse updoadDoctorProfile(@RequestParam("file") MultipartFile file, @RequestParam("doctorId") Long doctorId) {
        try {
            // Validate profile picture
            if (file.isEmpty()) {
                throw new BackEndException("No se encontro archivo");
            }
            // Valid Size
            if (file.getSize() > ApplicationKeys.MAX_SIZE_FILE) {
                throw new BackEndException("Imagen excede el tamaño limite permitido");
            }
            String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(StringUtil.DOT) + NumberUtil.ONE_INT);
            // Validate if extension is valid
            if (!Arrays.asList(ApplicationKeys.ARRAY_AVAILABLE_IMAGES_PROFILE).contains(extension)) {
                throw new BackEndException("Invalid extension, available extension: " + Arrays.asList(ApplicationKeys.ARRAY_AVAILABLE_IMAGES_PROFILE).toString());
            }
            String serverPath = ApplicationKeys.PATH_SERVER_FILES;
            String profilePictureDirectory = StringUtil.SLASH + ApplicationKeys.FOLDER_FILES + StringUtil.SLASH + ApplicationKeys.FOLDER_DOCTOR + doctorId + StringUtil.SLASH + ApplicationKeys.FOLDER_DOCTOR_PROFILE_PICTURE;
            // Create folder if it does not exist
            FileUtil.createFolderIfNotExist(serverPath + profilePictureDirectory);
            // Build the full path image
            String finalNameFile = StringUtil.SLASH + ApplicationKeys.FOLDER_DOCTOR + doctorId + StringUtil.DOT + extension;
            // Find doctor
            Doctor doctor = doctorService.findDoctorById(doctorId);
            // If doctor has profile picture, delete phisically the image
            if (doctor != null && doctor.getProfileImage() != null && !doctor.getProfileImage().isEmpty()) {
                FileUtil.deleteFileByPath(serverPath + doctor.getProfileImage());
            }
            // Upload the file
            FileUtil.uploadFile(serverPath + profilePictureDirectory + finalNameFile, file.getBytes());
            // Update profile picture in DB
            doctorService.updateProfilePicturePath(doctorId, profilePictureDirectory + finalNameFile);
            // Return response
            return new ApiResponse(false, finalNameFile + finalNameFile);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to display an a picture of doctor
     *
     * @param request Request of client
     * @param response Response generated
     * @param path Path of image
     */
    @RequestMapping(value = "/getProfilePicture", method = RequestMethod.GET , produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public void getProfilePicture(HttpServletRequest request, HttpServletResponse response, @RequestParam("url") String path) {
        CommonUtil.findFileInServe(request, response, path);
    }
}
