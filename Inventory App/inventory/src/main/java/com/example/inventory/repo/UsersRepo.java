package com.example.inventory.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.inventory.model.Users;

public interface UsersRepo extends JpaRepository<Users, Integer> {

    Users findByUsername(String username);

}
