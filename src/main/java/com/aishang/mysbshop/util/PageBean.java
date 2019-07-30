package com.aishang.mysbshop.util;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
    private Integer PageNow=1;
    private Integer PageSize;
    private Integer PageCount;
    private Integer RowCount;
    private Integer star;
    private List<T> alist=new ArrayList<T>();

    @Override
    public String toString() {
        return "PageBean{" +
                "PageNow=" + PageNow +
                ", PageSize=" + PageSize +
                ", PageCount=" + PageCount +
                ", RowCount=" + RowCount +
                ", star=" + star +
                ", alist=" + alist +
                '}';
    }

    public Integer getStar() {
        star=(PageNow-1)*PageSize;
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public Integer getPageNow() {
        return PageNow;
    }

    public void setPageNow(Integer pageNow) {
        PageNow = pageNow;
    }

    public Integer getPageSize() {
        return PageSize;
    }

    public void setPageSize(Integer pageSize) {
        PageSize = pageSize;
    }

    public Integer getPageCount() {
        if(RowCount%PageSize==0){
            PageCount=RowCount/PageSize;
        }else{
            PageCount=RowCount/PageSize+1;
        }
        return PageCount;
    }

    public void setPageCount(Integer pageCount) {
        PageCount = pageCount;
    }

    public Integer getRowCount() {
        return RowCount;
    }

    public void setRowCount(Integer rowCount) {
        RowCount = rowCount;
    }

    public List<T> getAlist() {
        return alist;
    }

    public void setAlist(List<T> alist) {
        this.alist = alist;
    }
}
