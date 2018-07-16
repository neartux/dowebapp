package com.reliablesystems.doctoroffice.util.form;

import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;
import com.reliablesystems.doctoroffice.core.utils.common.StringUtil;

public final class DataTableUtil {

    private DataTableUtil() {}

    /**
     * Init params to datatable
     *
     * @param length Total length
     * @param elementsByPage Elements by page to show
     * @param pagesToDisplay Pages to print
     * @return RequestDataTable configures
     */
    public static RequestDataTable initRequestDataTable(int length, int elementsByPage, int pagesToDisplay) {
        RequestDataTable requestDataTable = new RequestDataTable();
        requestDataTable.setLength(length);
        requestDataTable.setElementsByPage(elementsByPage);

        Double residue = (double) length / (double) elementsByPage;
        requestDataTable.setNumPages((int) Math.round(residue));
        requestDataTable.setPagesToDisplay(pagesToDisplay);
        requestDataTable.setCurrentPage(NumberUtil.ONE_INT);
        requestDataTable.setExistMorePagesAfter(requestDataTable.getCurrentPage() < requestDataTable.getNumPages());
        requestDataTable.setExistMorePagesBefore(requestDataTable.getCurrentPage() > NumberUtil.ONE_INT);
        int start = ((requestDataTable.getCurrentPage() - NumberUtil.ONE_INT) * requestDataTable.getElementsByPage() == NumberUtil.ZERO_INT ? NumberUtil.ONE_INT : ((requestDataTable.getCurrentPage() - NumberUtil.ONE_INT) * requestDataTable.getElementsByPage()));
        int end = (requestDataTable.getCurrentPage() * requestDataTable.getElementsByPage()) > requestDataTable.getLength() ? requestDataTable.getLength() : (requestDataTable.getCurrentPage() * requestDataTable.getElementsByPage());

        requestDataTable.setStart(start);
        requestDataTable.setEnd(end);

        calculateButtonsPage(requestDataTable);

        return requestDataTable;
    }

    /**
     * Recalculate number of pages to data table
     *
     * @param requestDataTable Data
     * @return RequestDataTable
     */
    public static RequestDataTable recalculatePageNumberRequestDataTable(RequestDataTable requestDataTable) {
        Double residue = (double) requestDataTable.getLength() / (double) requestDataTable.getElementsByPage();
        requestDataTable.setNumPages((int) Math.round(residue));
        requestDataTable.setExistMorePagesAfter(requestDataTable.getCurrentPage() < requestDataTable.getNumPages());
        requestDataTable.setExistMorePagesBefore(requestDataTable.getCurrentPage() > NumberUtil.ONE_INT);
        int start = ((requestDataTable.getCurrentPage() - NumberUtil.ONE_INT) * requestDataTable.getElementsByPage() == NumberUtil.ZERO_INT ? NumberUtil.ONE_INT : ((requestDataTable.getCurrentPage() - NumberUtil.ONE_INT) * requestDataTable.getElementsByPage()));
        int end = (requestDataTable.getCurrentPage() * requestDataTable.getElementsByPage()) > requestDataTable.getLength() ? requestDataTable.getLength() : (requestDataTable.getCurrentPage() * requestDataTable.getElementsByPage());

        requestDataTable.setStart(start);
        requestDataTable.setEnd(end);

        calculateButtonsPage(requestDataTable);

        return requestDataTable;
    }

    /**
     * Calculete numbers of page to display in the view
     *
     * @param req Data
     */
    private static void calculateButtonsPage(RequestDataTable req) {
        // Get the middle page
        int middlePage = NumberUtil.toInt((double) req.getPagesToDisplay() / NumberUtil.TWO_INT);
        int countPages = req.getCurrentPage();
        //
        if (req.getCurrentPage() > NumberUtil.ONE_INT && req.getCurrentPage() <= middlePage) {
            countPages = NumberUtil.ONE_INT;
        }
        // For pages
        if(req.getCurrentPage() > NumberUtil.ONE_INT && req.getCurrentPage() > middlePage) {
            countPages = NumberUtil.substract(req.getCurrentPage(), middlePage).intValue();
        }
        // Calculate the limit pages
        int pagesLimit = (((NumberUtil.add(countPages, req.getPagesToDisplay()).intValue()) <= req.getNumPages()) ? ((NumberUtil.add(countPages, req.getPagesToDisplay()).intValue()) - NumberUtil.ONE_INT) : req.getNumPages());

        req.setCountPages(countPages);
        req.setPagesLimit(pagesLimit);
    }
}
