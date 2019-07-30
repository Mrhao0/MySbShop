package com.aishang.mysbshop.service.Impl;

import com.aishang.mysbshop.dao.IUserDao;
import com.aishang.mysbshop.po.Product;
import com.aishang.mysbshop.po.ProductBean;
import com.aishang.mysbshop.po.User;
import com.aishang.mysbshop.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class UserService implements IUserService {
    @Resource
    IUserDao iUserDao;
    public User selectUserByuser(User user) {
        return iUserDao.selectUserByuser(user);
    }

    @Override
    public ProductBean selectProductList(ProductBean productBean) {
        productBean.setPageSize(5);
        Integer rowcount=iUserDao.getRowCount(productBean);
        productBean.setRowCount(rowcount);
        List<Product> proList=iUserDao.selectProductList(productBean);
        productBean.setAlist(proList);
        return productBean;
    }
}
