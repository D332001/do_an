package com.core.service;

import com.core.entities.OrderProducts;
import com.core.repositories.OrderProductsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderProductsServiceImpl implements OrderProductsService{
    @Autowired
    OrderProductsRepo orderProductsRepo;

    @Override
    public List<OrderProducts> findByOrderProduct(int id) {
        return orderProductsRepo.findAllByOrderId(id);
    }

    @Override
    public void deleteOrderProduct(int id) {

    }

}
