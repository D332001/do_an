package com.core.controller.admin;

import com.core.entities.ReportOrderDto;
import com.core.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReportController {
    @Autowired
    OrderService orderService;

    @GetMapping("/report")
    public ReportOrderDto reportOrder(){
        return orderService.reportOrder();
    }
}
