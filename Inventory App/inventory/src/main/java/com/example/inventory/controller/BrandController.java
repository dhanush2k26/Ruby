package com.example.inventory.controller;

import java.util.List;

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
        // First save the brand to get an ID
        Brand newBrand = new Brand();
        newBrand.setName(brand.getName());
        Brand savedBrand = brandRepo.save(newBrand);
        
        // Now update each category to set the brand_id
        for (Category cat : brand.getCategories()) {
            Category category = categoryRepo.findById(cat.getId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            category.setBrand(savedBrand);
            categoryRepo.save(category);
            savedBrand.getCategories().add(category);
        }
        return ResponseEntity.ok(savedBrand);
    }
    @PutMapping("/brands/{id}")
    public ResponseEntity<Brand> updateBrand(@PathVariable Integer id, @RequestBody Brand brand) {
        Brand existingBrand = brandRepo.findById(id).orElseThrow(() -> new RuntimeException("Brand not found"));
        existingBrand.setName(brand.getName());
        
        // Clear brand from existing categories
        for (Category oldCat : existingBrand.getCategories()) {
            oldCat.setBrand(null);
            categoryRepo.save(oldCat);
        }
        existingBrand.getCategories().clear();
        
        // Set brand on new categories
        for (Category cat : brand.getCategories()) {
            Category category = categoryRepo.findById(cat.getId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            category.setBrand(existingBrand);
            categoryRepo.save(category);
            existingBrand.getCategories().add(category);
        }
        return ResponseEntity.ok(brandRepo.save(existingBrand));
    }

    @DeleteMapping("/brands/{id}")
    public ResponseEntity<Void> deleteBrand(@PathVariable Integer id) {
        Brand existingBrand = brandRepo.findById(id).orElseThrow(() -> new RuntimeException("Brand not found"));
        
        // Clear brand from all associated categories first
        for (Category cat : existingBrand.getCategories()) {
            cat.setBrand(null);
            categoryRepo.save(cat);
        }
        
        brandRepo.delete(existingBrand);
        return ResponseEntity.noContent().build();
    }
}
