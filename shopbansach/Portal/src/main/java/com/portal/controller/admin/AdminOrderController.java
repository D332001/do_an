package com.portal.controller.admin;

import com.portal.entities.Order;
import com.portal.entities.OrderProducts;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class AdminOrderController {

    RestTemplate restTemplate = new RestTemplate();


    @GetMapping(value = "/admin/list-order")
    public String listOrder(Model model){
        ResponseEntity<Order[]> orders = restTemplate.getForEntity("http://localhost:8081/admin/list-order", Order[].class);
        model.addAttribute("orders", orders.getBody());
        return "admin/order/list-order";
    }

    @GetMapping(value = "/admin/order/{id}")
    public String orderDetail(@PathVariable int id, Model model){
        String url = "http://localhost:8081/admin/order/"+id;
        ResponseEntity<OrderProducts[]> orderProducts = restTemplate.getForEntity(url, OrderProducts[].class);
        model.addAttribute("orderProducts", orderProducts.getBody());
        ResponseEntity<Order> orders = restTemplate.getForEntity("http://localhost:8081/admin/orders/"+id, Order.class);
        model.addAttribute("orders", orders.getBody());
        return  "admin/order/order-detail";
    }

    @GetMapping(value = "/admin/delete-order")
    public String deleOrder(@RequestParam int id){
        String url = "http://localhost:8081/admin/delete-order?id="+id;
        restTemplate.delete(url);
        return "redirect:/admin/list-order";
    }
}

