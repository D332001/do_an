package com.core.service;

import com.core.entities.Order;
import com.core.entities.ReportOrderDto;

import java.util.List;

public interface OrderService {
    List<Order> listOrder();
    void deleteOrder(int id);
    Order findByOrder(int id);
    ReportOrderDto reportOrder();
}
