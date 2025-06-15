package com.taobao.repository;

import com.taobao.entity.Customer;
import com.taobao.entity.Order;
import com.taobao.entity.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    
    Optional<Order> findByOrderNumber(String orderNumber);
    
    List<Order> findByCustomer(Customer customer);
    
    List<Order> findBySeller(Seller seller);
    
    List<Order> findByStatus(Order.OrderStatus status);
    
    List<Order> findByCustomerAndStatus(Customer customer, Order.OrderStatus status);
    
    List<Order> findBySellerAndStatus(Seller seller, Order.OrderStatus status);
    
    @Query("SELECT o FROM Order o WHERE o.createdAt BETWEEN :startDate AND :endDate")
    List<Order> findByDateRange(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
    
    @Query("SELECT o FROM Order o WHERE o.customer = :customer AND o.createdAt BETWEEN :startDate AND :endDate")
    List<Order> findByCustomerAndDateRange(@Param("customer") Customer customer, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
    
    @Query("SELECT o FROM Order o WHERE o.seller = :seller AND o.createdAt BETWEEN :startDate AND :endDate")
    List<Order> findBySellerAndDateRange(@Param("seller") Seller seller, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
} 