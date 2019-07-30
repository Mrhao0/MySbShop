package com.aishang.mysbshop.controller;

import com.aishang.mysbshop.po.ProductBean;
import com.aishang.mysbshop.po.User;
import com.aishang.mysbshop.service.IUserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/back")
public class UserController {
    @Resource
    HttpSession session;
    @Resource
    IUserService iUserService;
    @RequestMapping("products.do")
    public String products(ProductBean productBean, Model model){
        productBean=iUserService.selectProductList(productBean);
        model.addAttribute("productBean",productBean);
        return "products";
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/dologin")
    public String dologin(User user){
        user = iUserService.selectUserByuser(user);
        if(user!=null) {
            session.setAttribute("user",user);
            return "redirect:products.do";
        }else{
            return "redirect:login";
        }
    }
    @RequestMapping("/outLogin")
    public String outLogin(){
        session.invalidate();
        return "login";
    }
}
