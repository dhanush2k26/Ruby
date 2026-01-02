package com.example.inventory.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.inventory.model.Brand;

public interface BrandRepo extends JpaRepository<Brand, Integer> {

}
