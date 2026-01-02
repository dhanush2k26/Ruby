package com.example.inventory.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.inventory.model.Product;

public interface ProductRepo extends JpaRepository<Product, Integer> {

}
