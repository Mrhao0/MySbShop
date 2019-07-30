package com.aishang.mysbshop.service;

import com.aishang.mysbshop.po.Product;
import com.aishang.mysbshop.po.ProductBean;
import com.aishang.mysbshop.po.User;

import java.util.List;


public interface IUserService {
    User selectUserByuser(User user);

    ProductBean selectProductList(ProductBean productBean);
}
