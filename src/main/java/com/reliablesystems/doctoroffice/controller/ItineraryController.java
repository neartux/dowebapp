package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.doctorsoffice.DoctorsOfficeService;
import com.reliablesystems.doctoroffice.core.service.itinerary.ItineraryService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.utils.common.DateUtil;
import com.reliablesystems.doctoroffice.util.session.CompanySession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping(value = "/itinerary")
public class ItineraryController {
    @Autowired
    private DoctorsOfficeService doctorsOfficeService;
    @Autowired
    private ItineraryService itineraryService;

    /**
     * Display the view of diary
     *
     * @param model The viewbag
     * @return The view
     */
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display(Model model) {
        return "pages/itinerary/itinerary";
    }

    /**
     * Method to find offices by company
     *
     * @param request Client request
     * @return List of doctorsoffices
     */
    @RequestMapping(value = "/findDoctorsOfficces", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse findDoctorsOfficces(HttpServletRequest request) {
        try {
            return new ApiResponse(false, doctorsOfficeService.findDoctorsOfficesByCompany(CompanySession.getCompanyId(request)));
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to find itinerary by office and dates
     *
     * @param doctorOfficeId Id of the office
     * @param startDate Start date of the period
     * @param endDate End date of the period
     * @return Itinerary
     */
    @RequestMapping(value = "/findItineraryByOffice/{doctorOfficeId}", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse findItineraryByOffice(@PathVariable long doctorOfficeId, @RequestParam String startDate, @RequestParam String endDate) {
        System.out.println("doctorOfficeId = [" + doctorOfficeId + "], startDate = [" + startDate + "], endDate = [" + endDate + "]");
        try {
            Date startDateP = DateUtil.getDate(startDate, "");
            System.out.println("startDateP = " + startDateP);
            Date endDateP = DateUtil.getDate(startDate, "");
            System.out.println("endDateP = " + endDateP);
            return new ApiResponse(false, itineraryService.findItineraryByOfficeAndDate(doctorOfficeId, startDateP, endDateP));
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }
}
