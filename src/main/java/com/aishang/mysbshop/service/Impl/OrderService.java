package com.aishang.mysbshop.service.Impl;

import com.aishang.mysbshop.dao.IOrderDao;
import com.aishang.mysbshop.po.OrderExt;
import com.aishang.mysbshop.po.Orders;
import com.aishang.mysbshop.po.OrdersBean;
import com.aishang.mysbshop.po.ProductSp;
import com.aishang.mysbshop.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderService implements IOrderService {
    @Resource
    IOrderDao iOrderDao;

    @Override
    public OrdersBean selectOrderList(OrdersBean ordersBean) {
        ordersBean.setPageSize(5);
        Integer rowCount=iOrderDao.getOrdersPageCount(ordersBean);
        ordersBean.setRowCount(rowCount);
        List<Orders> list=iOrderDao.selectOrderBeanList(ordersBean);
        ordersBean.setAlist(list);
        return ordersBean;
    }

    @Override
    public OrderExt selectpAndo(OrderExt orderExt) {

        orderExt=iOrderDao.selectpAndo(orderExt);
        return orderExt;
    }

    @Override
    public void updateOstate(Orders orders) {
        iOrderDao.updateOstate(orders);
    }

    @Override
    public String getUserNameByUid(Integer uid) {
        String userName=iOrderDao.getUserNameByUid(uid);
        return userName;
    }
}
