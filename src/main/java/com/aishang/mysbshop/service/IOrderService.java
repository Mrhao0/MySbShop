package com.aishang.mysbshop.service;

import com.aishang.mysbshop.po.OrderExt;
import com.aishang.mysbshop.po.Orders;
import com.aishang.mysbshop.po.OrdersBean;
import com.aishang.mysbshop.po.ProductSp;

import java.util.List;

public interface IOrderService {
    OrdersBean selectOrderList(OrdersBean ordersBean);

    OrderExt selectpAndo(OrderExt orderExt);

    void updateOstate(Orders orders);

    String getUserNameByUid(Integer uid);
}
