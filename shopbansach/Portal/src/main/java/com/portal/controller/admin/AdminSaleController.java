package com.portal.controller.admin;

import com.portal.entities.Sale;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AdminSaleController {
    Sale sale = new Sale();
    RestTemplate restTemplate = new RestTemplate();

    @GetMapping(value = "/admin/sales")
    public String sale(Model model){
        ResponseEntity<Sale[]> sales = restTemplate.getForEntity("http://localhost:8081/sales", Sale[].class);
        model.addAttribute("sales", sales.getBody());
        return "admin/sale/list-sale";
    }

    @RequestMapping(value = "/admin/add-sale")
    public String addSale(Model model){
        model.addAttribute("sale", new Sale());
        return "admin/sale/add-sale";
    }

    @PostMapping(value = "/save-sale")
    public String saveSale(@ModelAttribute Sale sale){
        restTemplate.postForObject("http://localhost:8081/save-sale", sale, Sale.class);
        return "redirect:/admin/sales";
    }

    @GetMapping(value = "/delete-sale")
    public String deleteSale(@RequestParam int id){
        restTemplate.delete("http://localhost:8081/delete-sale?id="+id);
        return "redirect:/admin/sales";
    }

    @GetMapping(value = "/code-sale")
    public @ResponseBody Sale  findPriceByCode(@RequestParam String nameSale)
            throws IOException {
        String url = "http://localhost:8081/code-sale?nameSale="+nameSale;

        Map<String, String> params = new HashMap<String, String>();
        params.put("nameSale", nameSale);
        sale =  restTemplate.getForObject(url, Sale.class,params);
        return  sale;
    }

    @GetMapping(value = "/admin/edit-sale/{id}")
    public String updateSale(Model model, @PathVariable int id){
        String url ="http://localhost:8081/admin/edit-sale/"+id;
        Sale sale = restTemplate.getForObject(url, Sale.class);
        model.addAttribute("sale" , sale);
        return "admin/sale/edit-sale";
    }
}
