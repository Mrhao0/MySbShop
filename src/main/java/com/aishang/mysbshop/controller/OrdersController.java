package com.aishang.mysbshop.controller;

import com.aishang.mysbshop.po.OrderExt;
import com.aishang.mysbshop.po.Orders;
import com.aishang.mysbshop.po.OrdersBean;
import com.aishang.mysbshop.po.ProductSp;
import com.aishang.mysbshop.service.IOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrdersController {
    @Resource
    public IOrderService iOrderService;
    @RequestMapping("/orderlist.do")
    public String orderlist(OrdersBean ordersBean, Model model){
        ordersBean=iOrderService.selectOrderList(ordersBean);
        model.addAttribute("ordersBean",ordersBean);

        return "orders";
    }
    @RequestMapping("/orderitem.do")
    public String orderitem(OrderExt orderExt,Model model){
        orderExt=iOrderService.selectpAndo(orderExt);
        Integer uid = orderExt.getUid();
        String username=iOrderService.getUserNameByUid(uid);
        orderExt.setOname(username);
        model.addAttribute("orderExt",orderExt);
        return "ProInf";
    }
    @ResponseBody
    @RequestMapping("/changeState")
    public String changeState(Orders orders){
        iOrderService.updateOstate(orders);
        return "ok";
    }
}
