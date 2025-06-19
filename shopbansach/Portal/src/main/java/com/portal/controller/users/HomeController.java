package com.portal.controller.users;

import com.portal.entities.Product;
import com.portal.entities.Sale;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class HomeController {
    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String producs(Model model){
        ResponseEntity<Product[]> products = restTemplate.getForEntity("http://localhost:8081/admin/list-product", Product[].class);
        model.addAttribute("products", products.getBody());
        ResponseEntity<Sale[]> sales = restTemplate.getForEntity("http://localhost:8081/sales", Sale[].class);
        model.addAttribute("sales", sales.getBody());
        return "users/index";
    }

    @RequestMapping(value = "/finish", method = RequestMethod.GET)
    public String finish(){

        return "users/finish";
    }
}
