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
    // Global search field
    private Map<String, Object> search;
    // Search individual
    private List<Map<String, Object>> columns;
    // Data no datatable
    private int numPages;
    private int currentPage;
    private int elementsByPage;
    private String q;
    private int pagesToDisplay;
    private boolean existMorePagesAfter;
    private boolean existMorePagesBefore;
    private int end;
    private int countPages;
    private int pagesLimit;
    private Object data;

    @Override
    public String toString() {
        return "RequestDataTable{" +
                "draw=" + draw +
                ", start=" + start +
                ", length=" + length +
                ", order=" + order +
                ", search=" + search +
                ", columns=" + columns +
                ", numPages=" + numPages +
                ", currentPage=" + currentPage +
                ", elementsByPage=" + elementsByPage +
                ", q='" + q + '\'' +
                ", pagesToDisplay=" + pagesToDisplay +
                ", existMorePagesAfter=" + existMorePagesAfter +
                ", existMorePagesBefore=" + existMorePagesBefore +
                ", end=" + end +
                ", data=" + data +
                '}';
    }
}
