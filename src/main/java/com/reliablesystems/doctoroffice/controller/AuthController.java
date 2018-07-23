package com.reliablesystems.doctoroffice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/auth")
public class AuthController {

    /**
     * Invalidate a current session
     * @param request   Request instans
     * @param session  Session instans
     * @return Return to login
     */
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpSession session) {
        // se invalida la session.
        session.invalidate();
        return "redirect:" + request.getContextPath();
    }
}
