package com.aishang.mysbshop.dao;

import com.aishang.mysbshop.po.CNameACsName;
import com.aishang.mysbshop.po.Category;
import com.aishang.mysbshop.po.Categorysecond;
import com.aishang.mysbshop.po.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ITypeDao {
    List<Category> selectCategory();

    List<Categorysecond> selectCategorysecond(Integer cid);

    void insertAproduct(Product product);

    void updateIsHotByPid(Product product);

    void delProduct(Product product);

    Product getProduct(Product product);

    Integer getcid(Product product);

    String getPath(Product product);

    void updatep(Product product);

    CNameACsName getCsNameACName(Integer csid);
}
