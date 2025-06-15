package com.taobao.controller;

import com.taobao.dto.CartSyncRequest;
import com.taobao.entity.CartItem;
import com.taobao.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/cart")
@CrossOrigin(origins = "*")
public class CartController {
    
    @Autowired
    private CartService cartService;
    
    @GetMapping("/{customerId}")
    public ResponseEntity<List<CartItem>> getCartItems(@PathVariable Long customerId) {
        try {
            List<CartItem> items = cartService.getCartItems(customerId);
            return ResponseEntity.ok(items);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @PostMapping("/{customerId}/add")
    public ResponseEntity<CartItem> addToCart(
            @PathVariable Long customerId,
            @RequestParam Long productId,
            @RequestParam Integer quantity) {
        try {
            CartItem item = cartService.addToCart(customerId, productId, quantity);
            return ResponseEntity.ok(item);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    @PutMapping("/{customerId}/update")
    public ResponseEntity<CartItem> updateCartItem(
            @PathVariable Long customerId,
            @RequestParam Long productId,
            @RequestParam Integer quantity) {
        try {
            CartItem item = cartService.updateCartItem(customerId, productId, quantity);
            return ResponseEntity.ok(item);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    @DeleteMapping("/{customerId}/remove")
    public ResponseEntity<Map<String, String>> removeFromCart(
            @PathVariable Long customerId,
            @RequestParam Long productId) {
        try {
            cartService.removeFromCart(customerId, productId);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Item removed from cart");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    @DeleteMapping("/{customerId}/clear")
    public ResponseEntity<Map<String, String>> clearCart(@PathVariable Long customerId) {
        try {
            cartService.clearCart(customerId);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Cart cleared");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    @PostMapping("/{customerId}/sync")
    public ResponseEntity<Map<String, String>> syncCart(
            @PathVariable Long customerId,
            @RequestBody List<CartSyncRequest> items) {
        try {
            cartService.syncCart(customerId, items);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Cart synced successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
} 