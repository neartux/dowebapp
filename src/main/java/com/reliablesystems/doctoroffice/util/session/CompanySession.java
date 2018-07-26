package com.reliablesystems.doctoroffice.util.session;

import com.reliablesystems.doctoroffice.core.bridge.BusinessSpringContextBridge;
import com.reliablesystems.doctoroffice.core.domain.Company;
import com.reliablesystems.doctoroffice.core.domain.User;
import com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys;
import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;

import javax.servlet.http.HttpServletRequest;

public final class CompanySession {
    private CompanySession() {}

    /**
     * Get user data in session
     *
     * If user is in session, get data, else find user data and set in session
     * @param request Instans request
     * @return Data of user in session.
     */
    private static User getCurrentUser(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(ApplicationKeys.DATA_CURRENT_USER);
        if(user == null) {
            user = BusinessSpringContextBridge.services().getUserService().findUserByUserName(request.getUserPrincipal().getName());
            request.getSession().setAttribute(ApplicationKeys.DATA_CURRENT_USER, user);
        }
        return user;
    }

    /**
     * Get current data company
     *
     * If company data is in session, then get data, else find company by user and set in session
     * @param request Instans request
     * @return Data of company of user
     */
    private static Company getCurrentCompany(HttpServletRequest request) {
        Company company = (Company) request.getSession().getAttribute(ApplicationKeys.DATA_CURRENT_COMPANY);
        if(company == null) {
            User user = getCurrentUser(request);
            // If user has compnay
            if(user.getCompany() != null){
                company = BusinessSpringContextBridge.services().getCompanyService().findCompanyById(user.getCompany().getId());
                request.getSession().setAttribute(ApplicationKeys.DATA_CURRENT_COMPANY, company);
            }
        }
        return company;
    }

    /**
     * Get userId in session
     *
     * @param request Instans request.
     * @return Id of user.
     */
    public static long getUserId(HttpServletRequest request) {
        User user = getCurrentUser(request);
        return user != null ? user.getId() : NumberUtil.ZERO_LONG;
    }

    /**
     * Get companyId of company in session
     *
     * @param request Instans request.
     * @return Id of company.
     */
    public static long getCompanyId(HttpServletRequest request) {
        Company company = getCurrentCompany(request);
        return company != null ? company.getId() : NumberUtil.ZERO_LONG;
    }
}
