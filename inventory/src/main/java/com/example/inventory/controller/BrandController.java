package com.example.inventory.controller;

import java.util.List;
import java.util.Set;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.inventory.model.Brand;
import com.example.inventory.model.Category;
import com.example.inventory.repo.BrandRepo;
import com.example.inventory.repo.CategoryRepo;

@RestController
public class BrandController {

    @Autowired
    private BrandRepo brandRepo;

    @Autowired
    private CategoryRepo categoryRepo;

    @GetMapping("/brands")
    public List<Brand> getAllBrands() {
        return brandRepo.findAll();
    }

    @GetMapping("/brands/{id}")
    public ResponseEntity<Brand> getBrandById(@PathVariable Integer id) {
        Brand brand = brandRepo.findById(id).orElseThrow(() -> new RuntimeException("Brand not found"));
        return ResponseEntity.ok(brand);
    }

    @PostMapping("/brands")
    public ResponseEntity<Brand> createBrand(@RequestBody Brand brand) {
        // Create new brand
        Brand newBrand = new Brand();
        newBrand.setName(brand.getName());
        
        // Add categories to the brand (many-to-many, categories can be shared)
        Set<Category> categories = new HashSet<>();
        for (Category cat : brand.getCategories()) {
            Category category = categoryRepo.findById(cat.getId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            categories.add(category);
        }
        newBrand.setCategories(categories);
        
        return ResponseEntity.ok(brandRepo.save(newBrand));
    }
    
    @PutMapping("/brands/{id}")
    public ResponseEntity<Brand> updateBrand(@PathVariable Integer id, @RequestBody Brand brand) {
        Brand existingBrand = brandRepo.findById(id).orElseThrow(() -> new RuntimeException("Brand not found"));
        existingBrand.setName(brand.getName());
        
        // Clear existing categories and set new ones (many-to-many)
        existingBrand.getCategories().clear();
        
        for (Category cat : brand.getCategories()) {
            Category category = categoryRepo.findById(cat.getId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            existingBrand.getCategories().add(category);
        }
        
        return ResponseEntity.ok(brandRepo.save(existingBrand));
    }

    @DeleteMapping("/brands/{id}")
    public ResponseEntity<Void> deleteBrand(@PathVariable Integer id) {
        Brand existingBrand = brandRepo.findById(id).orElseThrow(() -> new RuntimeException("Brand not found"));
        brandRepo.delete(existingBrand);
        return ResponseEntity.noContent().build();
    }
}
