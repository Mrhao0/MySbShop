package com.aishang.mysbshop.po;

import java.util.ArrayList;
import java.util.List;

public class ProductSp extends OrderItem{
    Product product;

    @Override
    public String toString() {
        return "ProductSp{" +
                "product=" + product +
                '}';
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
