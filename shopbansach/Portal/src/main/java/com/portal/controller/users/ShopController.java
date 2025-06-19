package com.portal.controller.users;

import com.portal.entities.Category;
import com.portal.entities.Product;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class ShopController {
    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String producs(Model model){
        ResponseEntity<Product[]> products = restTemplate.getForEntity("http://localhost:8081/admin/list-product", Product[].class);
        model.addAttribute("listProducts", products.getBody());
        ResponseEntity<Category[]> category = restTemplate.getForEntity("http://localhost:8081/admin/list-category", Category[].class);
        model.addAttribute("categories",category.getBody());
        return "users/shop";
    }

    @GetMapping(value = "/search-product")
    public String searchProduct(Model model, @RequestParam("keyword") String keyword){
        ResponseEntity<Product[]> listProducts = restTemplate.getForEntity("http://localhost:8081/search-product?keyword="+keyword, Product[].class);
        model.addAttribute("listProducts", listProducts.getBody());
        model.addAttribute("keyword", keyword);
        ResponseEntity<Category[]> category = restTemplate.getForEntity("http://localhost:8081/admin/list-category", Category[].class);
        model.addAttribute("categories",category.getBody());
        return "users/shop";
    }
}
