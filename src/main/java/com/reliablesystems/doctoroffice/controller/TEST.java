package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.utils.common.NumberUtil;
import com.reliablesystems.doctoroffice.util.form.RequestDataTable;

public class TEST {

    public static void main(String[] args) {
        RequestDataTable req = new RequestDataTable();
        req.setLength(100);
        Double residue = 100D/10D;
        System.out.println("residue = " + residue);
        System.out.println("Math.round(residue) = " + Math.round(residue));
    }
}
