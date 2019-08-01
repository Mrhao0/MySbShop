package com.aishang.mysbshop.controller;

import com.aishang.mysbshop.po.ProductBean;
import com.aishang.mysbshop.po.User;
import com.aishang.mysbshop.service.IUserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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
    public String dologin(User user, String save, HttpServletResponse response) {

        user = iUserService.selectUserByuser(user);
        if (user != null) {
            session.setAttribute("user", user);
            Cookie cookie1 = new Cookie("userName1", user.getUserName());
            Cookie cookie2 = new Cookie("passWord1", user.getUserPassword());
            if ("1".equals(save)) {
                cookie1.setMaxAge(60 * 60 * 24 * 7);
                cookie2.setMaxAge(60 * 60 * 24 * 7);
            } else {
                cookie1.setMaxAge(0);
                cookie2.setMaxAge(0);
            }
            response.addCookie(cookie1);
            response.addCookie(cookie2);
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
