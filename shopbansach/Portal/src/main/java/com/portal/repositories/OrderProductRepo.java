package com.portal.repositories;

import com.portal.entities.OrderProducts;
import java.util.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderProductRepo extends JpaRepository<OrderProducts, Integer> {
    List<OrderProducts> findAllByOrderId(Integer id);
}
