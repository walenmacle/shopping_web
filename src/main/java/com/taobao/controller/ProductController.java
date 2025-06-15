package com.taobao.controller;

import com.taobao.entity.Product;
import com.taobao.entity.Review;
import com.taobao.entity.SalesStatistics;
import com.taobao.entity.Seller;
import com.taobao.service.ProductService;
import com.taobao.service.ReviewService;
import com.taobao.service.SalesStatisticsService;
import com.taobao.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/products")
@CrossOrigin(origins = "*")
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private ReviewService reviewService;
    
    @Autowired
    private SellerService sellerService;
    
    @Autowired
    private SalesStatisticsService salesStatisticsService;
    
    @GetMapping
    public ResponseEntity<List<Product>> getAllProducts() {
        List<Product> products = productService.getAllProducts();
        return ResponseEntity.ok(products);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Long id) {
        Optional<Product> product = productService.getProductById(id);
        return product.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping("/search")
    public ResponseEntity<List<Product>> searchProducts(@RequestParam String name) {
        List<Product> products = productService.searchProductsByName(name);
        return ResponseEntity.ok(products);
    }
    
    @GetMapping("/price-range")
    public ResponseEntity<List<Product>> getProductsByPriceRange(
            @RequestParam double minPrice, @RequestParam double maxPrice) {
        List<Product> products = productService.getProductsByPriceRange(minPrice, maxPrice);
        return ResponseEntity.ok(products);
    }
    
    @GetMapping("/available")
    public ResponseEntity<List<Product>> getAvailableProducts() {
        List<Product> products = productService.getAvailableProducts();
        return ResponseEntity.ok(products);
    }
    
    @GetMapping("/seller/{sellerId}")
    public ResponseEntity<List<Product>> getProductsBySeller(@PathVariable Long sellerId) {
        Optional<Seller> seller = sellerService.getSellerById(sellerId);
        if (seller.isPresent()) {
            List<Product> products = productService.getProductsBySeller(seller.get());
            return ResponseEntity.ok(products);
        }
        return ResponseEntity.notFound().build();
    }
    
    @GetMapping("/{id}/reviews")
    public ResponseEntity<List<Review>> getProductReviews(@PathVariable Long id) {
        Optional<Product> product = productService.getProductById(id);
        if (product.isPresent()) {
            List<Review> reviews = reviewService.getReviewsByProduct(product.get());
            return ResponseEntity.ok(reviews);
        }
        return ResponseEntity.notFound().build();
    }
    
    @GetMapping("/{id}/sales-statistics")
    public ResponseEntity<List<SalesStatistics>> getProductSalesStatistics(
            @PathVariable Long id,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
        Optional<Product> product = productService.getProductById(id);
        if (product.isPresent()) {
            List<SalesStatistics> statistics = salesStatisticsService.getSalesStatisticsByProductAndDateRange(
                    product.get(), startDate, endDate);
            return ResponseEntity.ok(statistics);
        }
        return ResponseEntity.notFound().build();
    }
    
    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestBody Product product) {
        Product savedProduct = productService.saveProduct(product);
        return new ResponseEntity<>(savedProduct, HttpStatus.CREATED);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Product> updateProduct(@PathVariable Long id, @RequestBody Product product) {
        Optional<Product> existingProduct = productService.getProductById(id);
        if (existingProduct.isPresent()) {
            product.setId(id);
            Product updatedProduct = productService.saveProduct(product);
            return ResponseEntity.ok(updatedProduct);
        }
        return ResponseEntity.notFound().build();
    }
    
    @PatchMapping("/{id}/stock")
    public ResponseEntity<Map<String, Object>> updateProductStock(
            @PathVariable Long id, @RequestParam int quantity) {
        boolean updated = productService.updateProductStock(id, quantity);
        if (updated) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("message", "库存更新成功");
            return ResponseEntity.ok(response);
        }
        Map<String, Object> response = new HashMap<>();
        response.put("success", false);
        response.put("message", "库存不足或商品不存在");
        return ResponseEntity.badRequest().body(response);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProduct(@PathVariable Long id) {
        Optional<Product> product = productService.getProductById(id);
        if (product.isPresent()) {
            productService.deleteProduct(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
} 