package com.core.repositories;

import com.core.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepo extends JpaRepository<Order, Integer> {
    Order findById(int id);

    @Query(value = "select count(o) from Order o where o.statusOrder = ?1")
    long countByStatusOrder(String status);
}
