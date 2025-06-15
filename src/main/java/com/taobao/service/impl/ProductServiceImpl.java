package com.taobao.service.impl;

import com.taobao.entity.Product;
import com.taobao.entity.Seller;
import com.taobao.repository.ProductRepository;
import com.taobao.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {
    
    @Autowired
    private ProductRepository productRepository;
    
    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    
    @Override
    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }
    
    @Override
    public List<Product> getProductsBySeller(Seller seller) {
        return productRepository.findBySeller(seller);
    }
    
    @Override
    public List<Product> searchProductsByName(String name) {
        return productRepository.findByNameContaining(name);
    }
    
    @Override
    public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {
        return productRepository.findByPriceRange(minPrice, maxPrice);
    }
    
    @Override
    public List<Product> getAvailableProducts() {
        return productRepository.findAvailableProducts();
    }
    
    @Override
    @Transactional
    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }
    
    @Override
    @Transactional
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
    
    @Override
    @Transactional
    public boolean updateProductStock(Long productId, int quantity) {
        Optional<Product> productOpt = productRepository.findById(productId);
        if (productOpt.isPresent()) {
            Product product = productOpt.get();
            // 检查库存是否足够
            if (product.getStock() >= quantity) {
                product.setStock(product.getStock() - quantity);
                productRepository.save(product);
                return true;
            }
        }
        return false;
    }
} 