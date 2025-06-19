package com.core.service;

import com.core.entities.Category;
import com.core.repositories.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired CategoryRepo categoryRepo;

    @Override
    public List<Category> findAllCategory() {
        return (List<Category>) categoryRepo.findAll();
    }

    @Override
    public Category saveCategory(Category category) {
        return categoryRepo.save(category);
    }

    @Override
    public void deleteCategory(int id) {
        categoryRepo.deleteById(id);
    }

    @Override
    public Optional<Category> findCategoryById(int id) {
        return categoryRepo.findById(id);
    }

    @Override
    public Optional<Category> updateCategory(Category category, int id) {
        Optional<Category> upCategory1 = categoryRepo.findById(id).map(
                category1 ->{
                    category1.setName(category.getName());
                    category1.setDescription(category.getDescription());
                    return categoryRepo.save(category1);
                }
        );
        return upCategory1;
    }

    @Override
    public List<Category> findCategoryNyname(String name) {
        return categoryRepo.findAllByName(name);
    }
}
