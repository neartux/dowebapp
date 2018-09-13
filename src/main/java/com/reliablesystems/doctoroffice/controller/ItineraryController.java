package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.doctorsoffice.DoctorsOfficeService;
import com.reliablesystems.doctoroffice.core.service.itinerary.ItineraryService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.itinerary.ItineraryTO;
import com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys;
import com.reliablesystems.doctoroffice.core.utils.common.DateUtil;
import com.reliablesystems.doctoroffice.util.session.CompanySession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

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
        model.addAttribute("MINUTS_DATE", ApplicationKeys.RANGE_BEETWEN_DATE);
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
     * @param month Month request
     * @param year Year request
     * @return Itinerary
     */
    @RequestMapping(value = "/findItineraryByOffice/{doctorOfficeId}", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse findItineraryByOffice(@PathVariable long doctorOfficeId, @RequestParam(required = false) Integer month, @RequestParam(required = false) Integer year) {
        try {
            return new ApiResponse(false, itineraryService.findItineraryByOfficeAndDate(doctorOfficeId, DateUtil.getFechaInicioMes(month, year), DateUtil.getFechaFinMes(month, year)));
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse createItinerary(@RequestBody ItineraryTO itineraryTO, HttpServletRequest request) {
        try {
            System.out.println("itineraryDetailTO.toString() = " + itineraryTO.toString());
            long userId = CompanySession.getUserId(request);
            System.out.println("userId = " + userId);
            itineraryService.createItinerary(itineraryTO, userId);
            return new ApiResponse(false, null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }
}
