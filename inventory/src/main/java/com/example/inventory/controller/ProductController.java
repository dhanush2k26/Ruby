package com.example.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.example.inventory.model.Category;
import com.example.inventory.model.ProductDetails;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.inventory.model.Product;
import com.example.inventory.repo.CategoryRepo;
import com.example.inventory.repo.ProductRepo;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductRepo repo;

    @Autowired
    private CategoryRepo categoryRepo;

    @GetMapping
    public List<Product> getAllProducts() {
        return repo.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Integer id) {
        Product product = repo.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        return ResponseEntity.ok(product);
    }
 
     @PostMapping
     ResponseEntity<Product> createProduct(@RequestBody Product product) {
        Category category = categoryRepo.findById(product.getCategory().getId())
                .orElseThrow(() -> new RuntimeException("Category not found"));
        product.setCategory(category);
        
        // Link product details to the product
        if (product.getDetails() != null) {
            for (ProductDetails detail : product.getDetails()) {
                detail.setProduct(product);
            }
        }
        
        Product savedProduct = repo.save(product);
        return ResponseEntity.ok(savedProduct);
     }
     
 

    @PutMapping("/{id}")
    public ResponseEntity<Product> updateProduct(@PathVariable Integer id, @RequestBody Product product) {
        Product existingProduct = repo.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        existingProduct.setName(product.getName());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setCategory(categoryRepo.findById(product.getCategory().getId())
                .orElseThrow(() -> new RuntimeException("Category not found")));
        
        // Clear existing details and add new ones
        existingProduct.getDetails().clear();
        if (product.getDetails() != null) {
            for (ProductDetails detail : product.getDetails()) {
                existingProduct.addDetail(detail.getName(), detail.getValue());
            }
        }
        
        return ResponseEntity.ok(repo.save(existingProduct));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProduct(@PathVariable Integer id) {
        Product existingProduct = repo.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        repo.delete(existingProduct);
        return ResponseEntity.noContent().build();
    }
}
