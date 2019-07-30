package com.aishang.mysbshop.po;

import java.util.ArrayList;
import java.util.List;

public class OrderExt extends Orders{
    List<OrderItemExt> orderItemList=new ArrayList<OrderItemExt>();
    Integer oid;

    @Override
    public String toString() {
        return "OrderExt{" +
                "orderItemList=" + orderItemList +
                ", oid=" + oid +
                '}';
    }

    @Override
    public Integer getOid() {
        return oid;
    }

    @Override
    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public List<OrderItemExt> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItemExt> orderItemList) {
        this.orderItemList = orderItemList;
    }
}
