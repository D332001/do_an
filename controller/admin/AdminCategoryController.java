package com.core.controller.admin;

import com.core.entities.Category;
import com.core.repositories.CategoryRepo;
import com.core.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/admin")
public class AdminCategoryController {
    @Autowired
    CategoryService categoryService;
    @GetMapping("/list-category")
    public List<Category> getCategory(){
        return categoryService.findAllCategory();
    }

    @PutMapping("/edit-category/{id}")
    public Optional<Category> editCategory(@RequestBody Category category, @PathVariable int id){
        return categoryService.updateCategory(category,id);
    }

    @PostMapping("/save-category")
    public Category addCategory(@RequestBody Category category){
        return categoryService.saveCategory(category);
    }

    @DeleteMapping("/delete-category/{id}")
    public void deleteCategory(@PathVariable int id){
        categoryService.deleteCategory(id);
    }

    @GetMapping("/search-category/{id}")
    public Optional<Category> findCateById(@PathVariable int id){
        return categoryService.findCategoryById(id);
    }

//    @GetMapping("/search-category")
//    public List<Category> findCateByName(@RequestParam("name") String name){
//        return categoryService.findCategoryNyname(name);
//    }
}
