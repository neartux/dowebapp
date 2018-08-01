package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.doctor.DoctorService;
import com.reliablesystems.doctoroffice.core.service.doctorsoffice.DoctorsOfficeService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.doctorsoffice.DoctorsOfficeTO;
import com.reliablesystems.doctoroffice.core.utils.doctorsoffice.DoctorsOfficeUtil;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;
import com.reliablesystems.doctoroffice.util.session.CompanySession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/doctorsoffice")
public class DoctorsOfficeController {
    @Autowired
    private DoctorsOfficeService doctorsOfficeService;
    @Autowired
    private DoctorService doctorService;

    /**
     * Display the view of list of doctors
     *
     * @return The view
     */
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display() {
        return "pages/doctorsoffice/doctorsOficeList";
    }

    /**
     * Method to find all doctorsoffices, inicialize datatable values
     *
     * @param requestDataTable Datatable data
     * @param request Client request
     * @return List of doctorsoffices
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse findDoctorsOficessByCompany(@RequestBody RequestDataTable requestDataTable, HttpServletRequest request) {
        try {
            long companyId = CompanySession.getCompanyId(request);
            int length = doctorsOfficeService.findDoctorsOfficesCountByCompany(companyId, requestDataTable.getSearch().get("value").toString());
            Map<String, Object> map = new HashMap<>();
            map.put("draw", requestDataTable.getDraw());
            map.put("recordsFiltered", length);
            map.put("recordsTotal", length);
            map.put("data", doctorsOfficeService.findDoctorsByCompany(companyId, requestDataTable.getStart(), requestDataTable.getLength(), requestDataTable.getSearch().get("value").toString()));

            return new ApiResponse(false, map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to find doctors by company to asociate with a doctorsoffice
     *
     * @param request Client request
     * @return List of doctors
     */
    @RequestMapping(value = "/findDoctors", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse findDoctorsByCompany(HttpServletRequest request) {
        try {
            return new ApiResponse(false, doctorService.findDoctorsByCompany(CompanySession.getCompanyId(request)));
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to create a new doctorsoffice
     *
     * @param doctorsOfficeTO Doctor data
     * @param request Client request
     * @return ApiResponse
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse createDoctorsOffice(@RequestBody DoctorsOfficeTO doctorsOfficeTO, HttpServletRequest request) {
        try {
            // Set company
            doctorsOfficeTO.setCompanyId(CompanySession.getCompanyId(request));
            Long doctorId = doctorsOfficeService.createDoctorsOffcie(DoctorsOfficeUtil.getDoctorsOfficeToCreate(doctorsOfficeTO));
            return new ApiResponse(false, doctorId);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to update a doctorsoffice
     *
     * @param doctorsOfficeTO DoctorsOffice data
     * @return ApiResponse Response
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public ApiResponse updateDoctorsOffice(@RequestBody DoctorsOfficeTO doctorsOfficeTO) {
        try {
            doctorsOfficeService.updateDoctorsOffice(doctorsOfficeTO);
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to delete a doctorsoffice
     *
     * @param doctorOfficeId DoctorsOffice id
     * @return ApiResponse response
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResponse deleteDoctorsOffice(@RequestParam("doctorOfficeId") long doctorOfficeId) {
        try {
            doctorsOfficeService.inactiveDoctorsOffice(doctorOfficeId);
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }
}
