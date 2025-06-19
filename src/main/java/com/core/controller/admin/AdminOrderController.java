package com.core.controller.admin;

import com.core.entities.Order;
import com.core.entities.OrderProducts;
import com.core.repositories.OrderRepo;
import com.core.service.OrderProductsService;
import com.core.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AdminOrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderProductsService orderProductsService;

    @Autowired
    OrderRepo orderRepo;

    @GetMapping(value = "/admin/list-order")
    public List<Order> listOrder(){
        List<Order> orders = orderService.listOrder();
        return orders;
    }

    @PostMapping(value = "/order/save-status")
    public  List<Order> statusOrder(String statusOrder, String id){
        List<Order> orders = orderService.listOrder();
        for(Order item: orders){
            if(item.getId().toString().equals(id)==true ){
                item.setStatusOrder(statusOrder);
                orderRepo.save(item);
            }
        }
        return orders;
    }

    @GetMapping(value = "/admin/order/{id}")
    public List<OrderProducts> findByOrderProduct(@PathVariable int id){
        List<OrderProducts> orderProducts = orderProductsService.findByOrderProduct(id);
        return orderProducts;
    }

    @GetMapping(value = "/admin/orders/{id}")
    public Order findByOrder(@PathVariable int id){
        Order orderProducts = orderService.findByOrder(id);
        return orderProducts;
    }

    @DeleteMapping(value = "/admin/delete-order")
    public void deleOrder(@RequestParam int id){
        orderService.deleteOrder(id);
    }


}
