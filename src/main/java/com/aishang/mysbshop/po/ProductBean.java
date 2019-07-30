package com.aishang.mysbshop.po;

import com.aishang.mysbshop.util.PageBean;

public class ProductBean extends PageBean<Product> {
    private String pName;
    private Integer cid;
    private Integer csid;
    private Integer pdel=0;

    @Override
    public String toString() {
        return "ProductBean{" +
                "pName='" + pName + '\'' +
                ", cid=" + cid +
                ", csid=" + csid +
                ", pdel=" + pdel +
                '}';
    }

    public Integer getPdel() {
        return pdel;
    }

    public void setPdel(Integer pdel) {
        this.pdel = pdel;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }
}
