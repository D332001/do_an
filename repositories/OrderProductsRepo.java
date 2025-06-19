package com.core.repositories;

import com.core.entities.OrderProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderProductsRepo extends JpaRepository<OrderProducts, Integer> {

    List<OrderProducts> findAllByOrderId(int orderId);
}
