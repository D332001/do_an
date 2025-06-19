package com.portal.controller.users;

import com.portal.entities.Category;
import com.portal.entities.Comment;
import com.portal.entities.Product;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class ProductController {

    RestTemplate restTemplate = new RestTemplate();
    @RequestMapping(value = "/product/{seo}",method = RequestMethod.GET)
    public String productDetail(@PathVariable("seo") String seo, final ModelMap model){
        ResponseEntity<Category[]> categories = restTemplate.getForEntity("http://localhost:8081/admin/list-category", Category[].class);
        model.addAttribute("categories", categories.getBody());
        ResponseEntity<Product> product = restTemplate.getForEntity("http://localhost:8081/product/"+seo, Product.class);
        model.addAttribute("product", product.getBody());
        ResponseEntity<Comment[]> comments = restTemplate.getForEntity("http://localhost:8081/comment-product/"+seo, Comment[].class);
        model.addAttribute("comments", comments.getBody());
        model.addAttribute("size", comments.getBody().length);
        ResponseEntity<Product[]> products = restTemplate.getForEntity("http://localhost:8081/admin/list-product", Product[].class);
        model.addAttribute("products", products.getBody());
        return "users/product-detail";

    }
}
