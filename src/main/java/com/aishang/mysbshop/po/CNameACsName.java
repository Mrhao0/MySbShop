package com.aishang.mysbshop.po;

public class CNameACsName {
    private String cname;
    private String csname;

    @Override
    public String toString() {
        return "CNameACsName{" +
                "cname='" + cname + '\'' +
                ", csname='" + csname + '\'' +
                '}';
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCsname() {
        return csname;
    }

    public void setCsname(String csname) {
        this.csname = csname;
    }
}
