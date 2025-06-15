package com.taobao.service;

import com.taobao.entity.Customer;
import com.taobao.entity.Order;
import com.taobao.entity.Seller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface OrderService {
    
    List<Order> getAllOrders();
    
    Optional<Order> getOrderById(Long id);
    
    Optional<Order> getOrderByOrderNumber(String orderNumber);
    
    List<Order> getOrdersByCustomer(Customer customer);
    
    List<Order> getOrdersBySeller(Seller seller);
    
    List<Order> getOrdersByStatus(Order.OrderStatus status);
    
    List<Order> getOrdersByCustomerAndStatus(Customer customer, Order.OrderStatus status);
    
    List<Order> getOrdersBySellerAndStatus(Seller seller, Order.OrderStatus status);
    
    List<Order> getOrdersByDateRange(Date startDate, Date endDate);
    
    List<Order> getOrdersByCustomerAndDateRange(Customer customer, Date startDate, Date endDate);
    
    List<Order> getOrdersBySellerAndDateRange(Seller seller, Date startDate, Date endDate);
    
    Order createOrder(Order order);
    
    Order updateOrderStatus(Long orderId, Order.OrderStatus status);
    
    Order updatePaymentStatus(Long orderId, Order.PaymentStatus paymentStatus);
    
    Order updateLogisticsStatus(Long orderId, Order.LogisticsStatus logisticsStatus, String logisticsCompany, String trackingNumber);
    
    void deleteOrder(Long id);
} 