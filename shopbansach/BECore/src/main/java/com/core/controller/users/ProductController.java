package com.core.controller.users;

import com.core.entities.Product;
import com.core.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProductController extends BaseController{
    @Autowired ProductService productService;
    
    @RequestMapping("/search-product")
    public List<Product> products(Model model, @Param("keyword") String keyword) {
        List<Product> listProducts = productService.listAll(keyword);
        return listProducts;
    }
}
