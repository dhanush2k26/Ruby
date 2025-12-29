package com.example.productmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.productmanagement.model.Product;
import com.example.productmanagement.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
	private  ProductRepository productRepository;
	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return productRepository.findAll();
	}

	@Override
	public Product getProductById(Long id) {
		// TODO Auto-generated method stub
		return productRepository.findById(id).orElseThrow(()-> new RuntimeException("Product not found"));
	}

	@Override
	public Product createProduct(Product product) {
		// TODO Auto-generated method stub
		return productRepository.save(product);
	}

	@Override
	public Product updateProduct(Long id, Product product) {
 		// TODO Auto-generated method stub
		 Product existingProduct = productRepository.findById(id)
	                .orElseThrow(() -> new RuntimeException("Product not found"));

	        existingProduct.setName(product.getName());
	        existingProduct.setDescription(product.getDescription());
	        existingProduct.setPrice(product.getPrice());
	        existingProduct.setQuantity(product.getQuantity());
	        existingProduct.setCategory(product.getCategory());

	        return productRepository.save(existingProduct);
		
	}

	@Override
	public void deleteProduct(Long id) {
    Product product = productRepository.findById(id)
				.orElseThrow(() -> new RuntimeException("Product not found"));
		productRepository.delete(product);		
	}

}