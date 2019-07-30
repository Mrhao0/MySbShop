package com.aishang.mysbshop.interceptors;

import com.aishang.mysbshop.po.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class MyInterceptors implements HandlerInterceptor {
    @Resource
    HttpSession session;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        User user=(User)session.getAttribute("user");
        if(user!=null){
            return true;
        }else{
            response.sendRedirect("/MySbShop/back/login");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        System.out.println("\n\n\n"+"asdasdasdasda"+"\n\n\n");
//        System.out.println("\n\n\n"+response.getStatus()+"\n\n\n");
//        if(response.getStatus()==500){
//            System.out.println("\n\n\n"+"asdasdasdasda"+"\n\n\n");
//            modelAndView.setViewName("/errorpage/500");
//        }else if(response.getStatus()==404){
//            modelAndView.setViewName("/errorpage/404");
//        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
