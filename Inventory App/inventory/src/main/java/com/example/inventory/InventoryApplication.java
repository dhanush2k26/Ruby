package com.example.inventory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class InventoryApplication {

	public static void main(String[] args) {
		// BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        // String rawPassword = "#abr4ever"; 
        // String hashedPassword = encoder.encode(rawPassword);
        // System.out.println("Raw password: " + rawPassword);
        // System.out.println("Hashed password: " + hashedPassword);
		SpringApplication.run(InventoryApplication.class, args);
	}

}
