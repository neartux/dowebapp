package com.reliablesystems.doctoroffice.util.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@NoArgsConstructor
@Getter
@Setter
public class RequestDataTable {
    private int draw;
    private int start;
    private int length;
    private List<Map<String, Object>> order;
    private Map<String, Object> search;
    private List<Map<String, Object>> columns;

    @Override
    public String toString() {
        return "RequestDataTable{" +
                "draw=" + draw +
                ", start=" + start +
                ", length=" + length +
                ", order=" + order +
                ", search=" + search +
                ", columns=" + columns +
                '}';
    }
}
