package com.aishang.mysbshop.service.Impl;

import com.aishang.mysbshop.dao.ITypeDao;
import com.aishang.mysbshop.po.CNameACsName;
import com.aishang.mysbshop.po.Category;
import com.aishang.mysbshop.po.Categorysecond;
import com.aishang.mysbshop.po.Product;
import com.aishang.mysbshop.service.IProductService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ProductService implements IProductService {
    @Resource
    ITypeDao iTypeDao;
    @Resource
    ServletContext servletContext;
    @Override
    public List<Category> selectCategory() {

        return iTypeDao.selectCategory();
    }

    @Override
    public List<Categorysecond> selectCategorysecond(Integer cid) {

        return iTypeDao.selectCategorysecond(cid);
    }
    @Transactional
    @Override
    public void addProduct(MultipartFile file, File img, Product product) {
        String path=img.toString();
        path=path.replace("\\","/");
        path=path.replace("src/main/webapp/","");
        path=path.replace("D:/","");
        path="http://127.0.0.1:8081/"+path;
        System.out.println("new path:"+path);
        product.setImage(path);
        try {
            file.transferTo(img);
        } catch (IOException e){
            e.printStackTrace();
        }
        try{
            iTypeDao.insertAproduct(product);
            //int a=1/0;
        }catch (Exception e){
            img.delete();
            throw new RuntimeException();
        }
    }
    @Override
    public void updateIsHotByPid(Product product) {
        iTypeDao.updateIsHotByPid(product);
    }

    @Override
    public void delProduct(Product product) {
        iTypeDao.delProduct(product);
    }

    @Override
    public Product getProduct(Product product) {

        return iTypeDao.getProduct(product);
    }

    @Override
    public Integer getcid(Product product) {

        return iTypeDao.getcid(product);
    }

    @Override
    public String getPath(Product product) {

        return iTypeDao.getPath(product);
    }

    @Override
    public void updatep(Product product, File delf, File savef, MultipartFile file) {
        String path=savef.toString();
        String substring = path.substring(0,path.lastIndexOf("\\"));
        System.out.println(substring);
        File file1=new File(substring);
        delf.delete();
        if(!file1.exists()){
            file1.mkdirs();
        }
        try {
            file.transferTo(savef);
        } catch (IOException e) {
            e.printStackTrace();
        }

        iTypeDao.updatep(product);
    }

    @Override
    public CNameACsName getCsNameACName(Integer csid) {
        return iTypeDao.getCsNameACName(csid);
    }
}
