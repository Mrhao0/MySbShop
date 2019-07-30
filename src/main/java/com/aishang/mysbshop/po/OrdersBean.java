package com.aishang.mysbshop.po;

import com.aishang.mysbshop.util.PageBean;

public class OrdersBean extends PageBean<Orders> {
    private Integer state;
    private Integer oid;

    @Override
    public String toString() {
        return "OrdersBean{" +
                "state=" + state +
                ", oid=" + oid +
                '}';
    }

    public Integer getState() {

        return state;
    }

    public void setState(Integer state) {
        if(state==0){
            state=null;
        }
        this.state = state;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }
}
