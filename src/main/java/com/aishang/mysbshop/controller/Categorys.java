package com.aishang.mysbshop.controller;

import com.aishang.mysbshop.po.*;
import com.aishang.mysbshop.service.IProductService;
import com.aishang.mysbshop.service.IUserService;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.awt.font.MultipleMaster;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class Categorys {
    @Resource
    ServletContext servletContext;
    @Resource
    IProductService iProductService;
    @Resource
    IUserService iUserService;
    @ResponseBody
    @RequestMapping("/types")
    public String types(){
        List<Category> list1=iProductService.selectCategory();
        String flist = JSON.toJSONString(list1);
        return flist;
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/typechange")
    @ResponseBody
    public String typechange(Category category){
        Integer cid=category.getCid();
       List<Categorysecond> list2= iProductService.selectCategorysecond(cid);
        String slist = JSON.toJSONString(list2);
        return slist;
    }
    @RequestMapping("/productUp.do")
    public String productUp(){

        return "productUp";
    }
    @RequestMapping("/productUpimg.do")
    public String productUpimg(@RequestParam(value = "img")MultipartFile file,Product product,Integer cid,Model model){


        String path1="";
        String path2="";
        List<Category> list1=iProductService.selectCategory();
        for (Category c:list1
             ) {
            if(c.getCid()==cid){
                path1=c.getCname();
            }
        }
        List<Categorysecond> list2= iProductService.selectCategorysecond(cid);
        for (Categorysecond cs:list2
             ) {
            if(cs.getCsid()==product.getCsid()){
                path2=cs.getCsname();
            }
        }
        String realPath = servletContext.getRealPath("");
        realPath=realPath+"\\images"+"\\"+path1+"\\"+path2;

        File filee=new File(realPath);

            if(!filee.exists()){
                filee.mkdirs();
            }

        realPath=realPath+"\\"+file.getOriginalFilename();

            File img=new File(realPath);
            try {
                System.out.println("\n\n\n"+1+"\n\n\n");
                iProductService.addProduct(file, img, product);
            }catch(Exception e){
                model.addAttribute("cid",cid);
                model.addAttribute("upload","no");
                model.addAttribute("product",product);
                return "productUp";
            }
        return "redirect:/back/products.do";
    }
    @RequestMapping("/isHotAjax.do")
    @ResponseBody
        public String isHotAjax(Product product){
        iProductService.updateIsHotByPid(product);
        System.out.println(product);
        return "123";
        }
    @RequestMapping("/delp")
    @ResponseBody
    public String delp(Product product){
        iProductService.delProduct(product);
        return "ok";
    }
    @RequestMapping("/update.do")
    public String update(Product product,Model model,ProductBean productBean){
        Integer cid=iProductService.getcid(product);
        product=iProductService.getProduct(product);
        model.addAttribute("product",product);
        model.addAttribute("cid",cid);
        model.addAttribute("productBean",productBean);
        return "productUpdate";
    }
    @RequestMapping("/updatep.do")
    public String updatep(@RequestParam(value = "img")MultipartFile file,Product product,Model model,Integer cid,Integer rcid,Integer rcsid,Integer rpageNow){
        StringBuffer s=new StringBuffer("redirect:/back/products.do");
        if(rcid!=null){
            s.append("?cid="+rcid);
        }
        if(rcsid!=null){
            s.append("&cid="+rcsid);
        }
        if(rcid==null && rcsid==null){
            s.append("?pageNow="+rpageNow);
        }else{
            s.append("&pageNow="+rpageNow);
        }

        String path1="";
        String path2="";
        String delpath="";
        String updatepath="";
        String savepath="";
        List<Category> list1=iProductService.selectCategory();
        for (Category c:list1
        ) {
            if(c.getCid()==cid){
                path1=c.getCname();
            }
        }
        List<Categorysecond> list2= iProductService.selectCategorysecond(cid);
        for (Categorysecond cs:list2
        ) {
            if(cs.getCsid()==product.getCsid()){
                path2=cs.getCsname();
            }
        }
        updatepath="http://127.0.0.1:8081/MySbShop/"+"images/"+path1+"/"+path2+"/"+file.getOriginalFilename();
        String path=iProductService.getPath(product);
        path=path.replace("http://127.0.0.1:8081/MySbShop/","");
        path=path.replace("/","\\");
        String realPath = servletContext.getRealPath("");
        savepath=realPath+"images\\"+path1+"\\"+path2+"\\"+file.getOriginalFilename();
        delpath=realPath+path;
        product.setImage(updatepath);
        File delf=new File(delpath);
        File savef=new File(savepath);
        iProductService.updatep(product,delf,savef,file);
        return s.toString();
    }
    @RequestMapping("/pinf.do")
    public String pinf(Product product,Model model,ProductBean productBean){
        product = iProductService.getProduct(product);
        Integer csid = product.getCsid();
        Integer cid=iProductService.getcid(product);
        CNameACsName cac=iProductService.getCsNameACName(csid);
        model.addAttribute("product",product);
        model.addAttribute("cac",cac);
        model.addAttribute("productBean",productBean);
        return "productInf";
    }
}
