package com.core.service;

import com.core.entities.Category;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    List<Category> findAllCategory();

    Category saveCategory(Category category);

    void deleteCategory(int id);

    Optional<Category> findCategoryById(int id);

    Optional<Category> updateCategory(Category category, int id);

    List<Category> findCategoryNyname(String name);
}
