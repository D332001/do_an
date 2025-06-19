package com.core.service;

import com.core.entities.Order;
import com.core.entities.ReportOrderDto;
import com.core.repositories.OrderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    OrderRepo orderRepo;

    @Override
    public List<Order> listOrder() {
        return orderRepo.findAll();
    }

    @Override
    public void deleteOrder(int id) {
        orderRepo.deleteById(id);
    }

    @Override
    public Order findByOrder(int id) {
        return orderRepo.findById(id);
    }

    @Override
    public ReportOrderDto reportOrder() {
        ReportOrderDto orderDto = new ReportOrderDto();
        long deli = orderRepo.countByStatusOrder("Da giao");
        long watting = orderRepo.countByStatusOrder("Dang cho");
        long cancel = orderRepo.countByStatusOrder("Da huy");
        orderDto.setDelivered(deli);
        orderDto.setWaiting(watting);
        orderDto.setCancel(cancel);
        return orderDto;
    }


}
