package com.core.controller.users;

import java.util.List;

import com.core.entities.Category;
import com.core.repositories.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class BaseController {
	@Autowired
	CategoryRepo categoryRepo;

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryRepo.findAll();
	}
}
