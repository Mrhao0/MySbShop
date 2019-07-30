package com.aishang.mysbshop.service;

import com.aishang.mysbshop.po.CNameACsName;
import com.aishang.mysbshop.po.Category;
import com.aishang.mysbshop.po.Categorysecond;
import com.aishang.mysbshop.po.Product;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

public interface IProductService {

    List<Category> selectCategory();

    List<Categorysecond> selectCategorysecond(Integer cid);

    void addProduct(MultipartFile file, File img, Product product);

    void updateIsHotByPid(Product product);

    void delProduct(Product product);

    Product getProduct(Product product);

    Integer getcid(Product product);

    String getPath(Product product);

    void updatep(Product product, File delf, File savef, MultipartFile file);

    CNameACsName getCsNameACName(Integer csid);
}
