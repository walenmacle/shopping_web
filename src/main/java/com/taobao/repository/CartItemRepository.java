package com.taobao.repository;

import com.taobao.entity.CartItem;
import com.taobao.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    
    List<CartItem> findByCustomer(Customer customer);
    
    Optional<CartItem> findByCustomerAndProduct_Id(Customer customer, Long productId);
    
    @Modifying
    @Query("DELETE FROM CartItem c WHERE c.customer = ?1")
    void deleteByCustomer(Customer customer);
    
    @Modifying
    @Query("DELETE FROM CartItem c WHERE c.customer = ?1 AND c.product.id = ?2")
    void deleteByCustomerAndProductId(Customer customer, Long productId);
} 