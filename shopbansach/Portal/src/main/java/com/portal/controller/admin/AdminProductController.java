package com.portal.controller.admin;

import com.portal.entities.Category;
import com.portal.entities.Product;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdminProductController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/admin/list-product", method = RequestMethod.GET)
    public String listProduct(Model model){
        ResponseEntity<Product[]> products = restTemplate.getForEntity("http://localhost:8081/admin/list-product", Product[].class);
        model.addAttribute("products", products.getBody());
        return "admin/product/list-product";
    }

    @RequestMapping(value = { "/admin/edit-product/{seo}" }, method = RequestMethod.GET)
    public String editProduct(@PathVariable("seo") String seo, final ModelMap model
            )
            throws Exception {
        ResponseEntity<Category[]> categories = restTemplate.getForEntity("http://localhost:8081/admin/list-categories", Category[].class);
        model.addAttribute("categories", categories.getBody());
        ResponseEntity<Product> product = restTemplate.getForEntity("http://localhost:8081/product/"+seo, Product.class);
        model.addAttribute("product", product.getBody());
        return "admin/product/edit-product";
    }

    @RequestMapping(value = { "/admin/add-product"})
	public String addProduct( ModelMap model)
			throws Exception {
        ResponseEntity<Category[]> categories = restTemplate.getForEntity("http://localhost:8081/admin/list-categories", Category[].class);
        model.addAttribute("categories", categories.getBody());
		model.addAttribute("product", new Product());
		return "admin/product/add-product";
	}

    @RequestMapping(value = "/admin/save-product", method = RequestMethod.POST)
    public String saveProduct(ProductInfo productInfo, @ModelAttribute Product product){
        MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
        form.add("productImage", productInfo.getProductImage().getResource());
        form.add("productGson", product);
        String url = "http://localhost:8081/admin/save-product";
        restTemplate.postForObject(url,form, Object.class);
        return "redirect:/admin/list-product";
    }


    public static class ProductInfo{
        MultipartFile productImage;

        public MultipartFile getProductImage() {
            return productImage;
        }
        public void setProductImage(MultipartFile productImage) {

            this.productImage = productImage;
        }
    }

    @GetMapping(value = "/admin/delete-product/{id}")
    public String deleProduct(@PathVariable int id){
        restTemplate.delete("http://localhost:8081/admin/delete-product/"+id);
        return "redirect:/admin/list-product";
    }
}

