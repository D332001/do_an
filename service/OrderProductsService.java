package com.core.service;

import com.core.entities.OrderProducts;

import java.util.List;

public interface OrderProductsService {
    List<OrderProducts> findByOrderProduct(int id);
    void deleteOrderProduct(int id);
}
