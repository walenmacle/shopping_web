package com.taobao.service;

import com.taobao.dto.CartSyncRequest;
import com.taobao.entity.CartItem;
import com.taobao.entity.Customer;
import com.taobao.entity.Product;
import com.taobao.repository.CartItemRepository;
import com.taobao.repository.CustomerRepository;
import com.taobao.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CartService {
    
    @Autowired
    private CartItemRepository cartItemRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private ProductRepository productRepository;
    
    public List<CartItem> getCartItems(Long customerId) {
        Optional<Customer> customer = customerRepository.findById(customerId);
        if (customer.isPresent()) {
            return cartItemRepository.findByCustomer(customer.get());
        }
        throw new RuntimeException("Customer not found");
    }
    
    public CartItem addToCart(Long customerId, Long productId, Integer quantity) {
        Optional<Customer> customer = customerRepository.findById(customerId);
        Optional<Product> product = productRepository.findById(productId);
        
        if (customer.isPresent() && product.isPresent()) {
            Optional<CartItem> existingItem = cartItemRepository
                    .findByCustomerAndProduct_Id(customer.get(), productId);
            
            if (existingItem.isPresent()) {
                // 更新数量
                CartItem item = existingItem.get();
                item.setQuantity(item.getQuantity() + quantity);
                return cartItemRepository.save(item);
            } else {
                // 创建新的购物车项
                CartItem newItem = new CartItem();
                newItem.setCustomer(customer.get());
                newItem.setProduct(product.get());
                newItem.setQuantity(quantity);
                return cartItemRepository.save(newItem);
            }
        }
        throw new RuntimeException("Customer or Product not found");
    }
    
    public CartItem updateCartItem(Long customerId, Long productId, Integer quantity) {
        Optional<Customer> customer = customerRepository.findById(customerId);
        if (customer.isPresent()) {
            Optional<CartItem> cartItem = cartItemRepository
                    .findByCustomerAndProduct_Id(customer.get(), productId);
            
            if (cartItem.isPresent()) {
                CartItem item = cartItem.get();
                item.setQuantity(quantity);
                return cartItemRepository.save(item);
            }
        }
        throw new RuntimeException("Cart item not found");
    }
    
    public void removeFromCart(Long customerId, Long productId) {
        Optional<Customer> customer = customerRepository.findById(customerId);
        if (customer.isPresent()) {
            cartItemRepository.deleteByCustomerAndProductId(customer.get(), productId);
        }
    }
    
    public void clearCart(Long customerId) {
        Optional<Customer> customer = customerRepository.findById(customerId);
        if (customer.isPresent()) {
            cartItemRepository.deleteByCustomer(customer.get());
        }
    }
    
    public void syncCart(Long customerId, List<CartSyncRequest> items) {
        // 先清空现有购物车
        clearCart(customerId);
        
        // 添加新的购物车项
        for (CartSyncRequest item : items) {
            addToCart(customerId, item.getProductId(), item.getQuantity());
        }
    }
} 