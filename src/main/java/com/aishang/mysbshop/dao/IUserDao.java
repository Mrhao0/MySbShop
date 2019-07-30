package com.aishang.mysbshop.dao;

import com.aishang.mysbshop.po.Product;
import com.aishang.mysbshop.po.ProductBean;
import com.aishang.mysbshop.po.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IUserDao {
    User selectUserByuser(User user);

    List<Product> selectProductList(ProductBean productBean);

    Integer getRowCount(ProductBean productBean);
}
