package com.portal.controller.admin;

import com.portal.entities.ReportOrderDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class ReportController {
    RestTemplate restTemplate = new RestTemplate();

    @GetMapping(value = "/admin/report")
    public String reportOrder(Model model){
        ResponseEntity<ReportOrderDto> order = restTemplate.getForEntity("http://localhost:8081/report", ReportOrderDto.class);
        model.addAttribute("order", order.getBody());
        return "admin/report/report-order";
    }
}
