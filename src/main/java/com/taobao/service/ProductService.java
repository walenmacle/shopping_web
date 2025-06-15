package com.taobao.service;

import com.taobao.entity.Product;
import com.taobao.entity.Seller;

import java.util.List;
import java.util.Optional;

public interface ProductService {
    
    List<Product> getAllProducts();
    
    Optional<Product> getProductById(Long id);
    
    List<Product> getProductsBySeller(Seller seller);
    
    List<Product> searchProductsByName(String name);
    
    List<Product> getProductsByPriceRange(double minPrice, double maxPrice);
    
    List<Product> getAvailableProducts();
    
    Product saveProduct(Product product);
    
    void deleteProduct(Long id);
    
    boolean updateProductStock(Long productId, int quantity);
} 