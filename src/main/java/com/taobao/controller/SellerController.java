package com.taobao.controller;

import com.taobao.entity.Product;
import com.taobao.entity.Seller;
import com.taobao.service.ProductService;
import com.taobao.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/sellers")
@CrossOrigin(origins = "*")
public class SellerController {
    
    @Autowired
    private SellerService sellerService;
    
    @Autowired
    private ProductService productService;
    
    @GetMapping
    public ResponseEntity<List<Seller>> getAllSellers() {
        List<Seller> sellers = sellerService.getAllSellers();
        return ResponseEntity.ok(sellers);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Seller> getSellerById(@PathVariable Long id) {
        Optional<Seller> seller = sellerService.getSellerById(id);
        return seller.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping("/{id}/products")
    public ResponseEntity<List<Product>> getSellerProducts(@PathVariable Long id) {
        Optional<Seller> seller = sellerService.getSellerById(id);
        if (seller.isPresent()) {
            List<Product> products = productService.getProductsBySeller(seller.get());
            return ResponseEntity.ok(products);
        }
        return ResponseEntity.notFound().build();
    }
    
    @PostMapping
    public ResponseEntity<Seller> createSeller(@RequestBody Seller seller) {
        Seller savedSeller = sellerService.saveSeller(seller);
        return new ResponseEntity<>(savedSeller, HttpStatus.CREATED);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Seller> updateSeller(@PathVariable Long id, @RequestBody Seller seller) {
        Optional<Seller> existingSeller = sellerService.getSellerById(id);
        if (existingSeller.isPresent()) {
            seller.setId(id);
            Seller updatedSeller = sellerService.saveSeller(seller);
            return ResponseEntity.ok(updatedSeller);
        }
        return ResponseEntity.notFound().build();
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSeller(@PathVariable Long id) {
        Optional<Seller> seller = sellerService.getSellerById(id);
        if (seller.isPresent()) {
            sellerService.deleteSeller(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
} 