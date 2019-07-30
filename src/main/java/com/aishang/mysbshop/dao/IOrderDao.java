package com.aishang.mysbshop.dao;

import com.aishang.mysbshop.po.OrderExt;
import com.aishang.mysbshop.po.Orders;
import com.aishang.mysbshop.po.OrdersBean;
import com.aishang.mysbshop.po.ProductSp;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface IOrderDao {
    Integer getOrdersPageCount(OrdersBean ordersBean);

    List<Orders> selectOrderBeanList(OrdersBean ordersBean);
    //List<OrderExt>
    OrderExt selectpAndo(OrderExt orderExt);

    void updateOstate(Orders orders);

    String getUserNameByUid(Integer uid);
}
