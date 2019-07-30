package com.aishang.mysbshop.po;

public class OrderItemExt extends OrderItem {
    private Product product;

    @Override
    public String toString() {
        return "OrderItemExt{" +
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
