package com.aishang.mysbshop;

import com.aishang.mysbshop.interceptors.MyInterceptors;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@SpringBootConfiguration
public class MyInterceptorConfig implements WebMvcConfigurer {
    @Resource
    MyInterceptors myInterceptors;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(myInterceptors).addPathPatterns("/**/*.do");
    }
}
