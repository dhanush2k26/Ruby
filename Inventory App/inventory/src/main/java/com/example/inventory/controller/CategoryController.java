package com.example.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.example.inventory.model.Category;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.inventory.repo.CategoryRepo;

@RestController
public class CategoryController {

    @Autowired
    private CategoryRepo repo;
    
    @GetMapping("/categories")
    public ResponseEntity<List<Category>>  getCategories() {
        List<Category> listCategory=repo.findAll();
        return ResponseEntity.ok(listCategory);
    }


    @PostMapping("/categories")
    public ResponseEntity<Category> addCategory(@RequestBody Category category) {
        Category savedCategory=repo.save(category);
        return ResponseEntity.ok(savedCategory);
    }
    
}
