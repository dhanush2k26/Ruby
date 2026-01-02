package com.example.inventory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import com.example.inventory.model.Users;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.inventory.repo.UsersRepo;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import com.example.inventory.security.JwtUtil;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.http.ResponseEntity;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Map;


@RestController
public class UsersController {

     @Autowired
     private UsersRepo usersRepo;

     @Autowired
     private PasswordEncoder passwordEncoder;

     @Autowired
     private AuthenticationManager authenticationManager;

     @Autowired
     private JwtUtil jwtUtil;

    @GetMapping("/admin/users/info")
    public String getUserInfo() {
        return "Admin-only user management endpoints";
    }

    @GetMapping("/admin/users")
    public List<Users> listUsers() {
        return usersRepo.findAll();
    }

    @PostMapping("/admin/users")
    public ResponseEntity<String> createUser(@RequestBody Users user) {
        // basic role validation
        if (!isValidRole(user.getRole())) {
            return ResponseEntity.badRequest().body("Invalid role");
        }
        // encode password before saving
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        usersRepo.save(user);
        return ResponseEntity.ok("User created");
    }

    @PutMapping("/admin/users/{username}/role")
    public ResponseEntity<String> updateUserRole(@PathVariable String username, @RequestBody Users incoming) {
        Users existing = usersRepo.findByUsername(username);
        if (existing == null) {
            return ResponseEntity.notFound().build();
        }
        if (!isValidRole(incoming.getRole())) {
            return ResponseEntity.badRequest().body("Invalid role");
        }
        existing.setRole(incoming.getRole());
        usersRepo.save(existing);
        return ResponseEntity.ok("Role updated");
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestParam String username, @RequestParam String password) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password)
            );
            SecurityContextHolder.getContext().setAuthentication(authentication);
            Users user = usersRepo.findByUsername(username);
            String token = jwtUtil.generateToken(user.getUsername(), user.getRole());
            return ResponseEntity.ok(Map.of(
                "token", token,
                "username", user.getUsername(),
                "role", user.getRole()
            ));
        } catch (Exception e) {
            return ResponseEntity.status(401).body(Map.of("error", "Invalid credentials"));
        }
    }

    private boolean isValidRole(String role) {
        if (role == null) return false;
        switch (role.toUpperCase()) {
            case "ADMIN":
            case "MANAGER":
            case "USER":
            case "PUBLIC":
                return true;
            default:
                return false;
        }
    }

}
