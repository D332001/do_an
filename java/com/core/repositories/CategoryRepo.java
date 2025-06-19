package com.core.repositories;

import com.core.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CategoryRepo extends JpaRepository<Category, Integer> {
    List<Category> findAllByName(String name);
	
}
