package com.core.controller.admin;

import com.core.common.ProductSearch;
import com.core.entities.Category;
import com.core.entities.Product;
import com.core.repositories.CategoryRepo;
import com.core.repositories.ProductRepo;
import com.core.service.ProductService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
public class AdminProductController {
	
	@Autowired
	CategoryRepo categoryRepo;
	@Autowired
	ProductService productService;
	@Autowired public ProductRepo productRepo;
	
	@RequestMapping(value = { "/admin/list-product" }, method = RequestMethod.GET)
	public List<Product> listProduct()
	{
		List<Product> products = productRepo.findAll();
		return products;
	}

	@RequestMapping(value = { "/admin/list-categories" }, method = RequestMethod.GET)
	public List<Category> listCate()
	{
		List<Category> categories = categoryRepo.findAll();
		return categories;
	}

	@DeleteMapping(value = "/admin/delete-product/{id}")
	public void deleProduct(@PathVariable int id){
		productRepo.deleteById(id);
	}

	@RequestMapping(value = { "/product/{seo}" }, method = RequestMethod.GET)
	public Product editProduct(@PathVariable("seo") String seo)
			throws Exception {
		ProductSearch productSearch = new ProductSearch();
		productSearch.setSeoProduct(seo);
		return productService.search(productSearch).get(0);
	}

	@RequestMapping(value = {"/admin/save-product"}, method = RequestMethod.POST)
	public void saveProduct(@ModelAttribute ProductInfo productInfo ) throws Exception {
		Product product = new Gson().fromJson(productInfo.getProductGson(),Product.class);
		productService.saveProduct(new MultipartFile[]{productInfo.getProductImage()}, product);

	}

	public static class ProductInfo{
		MultipartFile productImage;
		String productGson;
		public MultipartFile getProductImage() {
			return productImage;
		}
		public void setProductImage(MultipartFile productImage) {
			this.productImage = productImage;
		}

		public String getProductGson() {
			return productGson;
		}

		public void setProductGson(String productGson) {
			this.productGson = productGson;
		}
	}

}
