package com.aishang.mysbshop.po;

public class Orders {
    private Integer oid;
    private Double total=0.0;
    private String ordertime;
    private Integer state;
    private String name;
    private String phone;
    private String addr;
    private Integer uid;
    private String oname;
    private Integer odel;

    @Override
    public String toString() {
        return "Orders{" +
                "oid=" + oid +
                ", total=" + total +
                ", ordertime='" + ordertime + '\'' +
                ", state=" + state +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", uid=" + uid +
                ", oname='" + oname + '\'' +
                ", odel=" + odel +
                '}';
    }

    public Integer getOdel() {
        return odel;
    }

    public void setOdel(Integer odel) {
        this.odel = odel;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
