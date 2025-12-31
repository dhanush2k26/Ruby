package com.example.inventory.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.inventory.model.Category;
import com.example.inventory.model.Product;

public interface CategoryRepo extends JpaRepository<Category, Integer> {

    Optional<Product> findByName(String name);

}
