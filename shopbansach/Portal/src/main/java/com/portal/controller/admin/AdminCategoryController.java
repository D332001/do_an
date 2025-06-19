package com.portal.controller.admin;

import com.portal.entities.Category;
import com.portal.entities.Product;
import com.portal.entities.Sale;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/admin")
public class AdminCategoryController {

    RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/list-category")
    public String categoryHome(Model model){
        ResponseEntity<Category[]> category = restTemplate.getForEntity("http://localhost:8081/admin/list-category", Category[].class);
        model.addAttribute("categories",category.getBody());
        return "admin/category/list-category";
    }

    @GetMapping("/add-category")
    public String addCategory(Model model){
        model.addAttribute("category", new Category());
        return "admin/category/add-category";
    }

    @PostMapping("/save-category")
    public  String saveCategory(@ModelAttribute Category category){
        restTemplate.postForObject("http://localhost:8081/admin/save-category",category,Category.class);
        return "redirect:/admin/list-category";
    }

    @GetMapping("/edit-category/{id}")
    public String editCategory(@PathVariable int id, Model model){
        String url = "http://localhost:8081/admin/search-category/"+id;
        Category category = restTemplate.getForObject(url, Category.class);
        model.addAttribute("category",category);
        return "admin/category/edit-category";
    }

    @GetMapping("/delete-category/{id}")
    public String delteCategory(@PathVariable int id){
        restTemplate.delete("http://localhost:8081/admin/delete-category/"+id);
        return "redirect:/admin/list-category";
    }
}
