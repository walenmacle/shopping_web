package com.taobao.service.impl;

import com.taobao.entity.Customer;
import com.taobao.entity.Order;
import com.taobao.entity.OrderItem;
import com.taobao.entity.Seller;
import com.taobao.repository.OrderRepository;
import com.taobao.service.OrderService;
import com.taobao.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {
    
    @Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private ProductService productService;
    
    @Override
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }
    
    @Override
    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }
    
    @Override
    public Optional<Order> getOrderByOrderNumber(String orderNumber) {
        return orderRepository.findByOrderNumber(orderNumber);
    }
    
    @Override
    public List<Order> getOrdersByCustomer(Customer customer) {
        return orderRepository.findByCustomer(customer);
    }
    
    @Override
    public List<Order> getOrdersBySeller(Seller seller) {
        return orderRepository.findBySeller(seller);
    }
    
    @Override
    public List<Order> getOrdersByStatus(Order.OrderStatus status) {
        return orderRepository.findByStatus(status);
    }
    
    @Override
    public List<Order> getOrdersByCustomerAndStatus(Customer customer, Order.OrderStatus status) {
        return orderRepository.findByCustomerAndStatus(customer, status);
    }
    
    @Override
    public List<Order> getOrdersBySellerAndStatus(Seller seller, Order.OrderStatus status) {
        return orderRepository.findBySellerAndStatus(seller, status);
    }
    
    @Override
    public List<Order> getOrdersByDateRange(Date startDate, Date endDate) {
        return orderRepository.findByDateRange(startDate, endDate);
    }
    
    @Override
    public List<Order> getOrdersByCustomerAndDateRange(Customer customer, Date startDate, Date endDate) {
        return orderRepository.findByCustomerAndDateRange(customer, startDate, endDate);
    }
    
    @Override
    public List<Order> getOrdersBySellerAndDateRange(Seller seller, Date startDate, Date endDate) {
        return orderRepository.findBySellerAndDateRange(seller, startDate, endDate);
    }
    
    @Override
    @Transactional
    public Order createOrder(Order order) {
        // 生成订单号
        order.setOrderNumber(generateOrderNumber());
        
        // 设置初始状态
        order.setStatus(Order.OrderStatus.PENDING);
        order.setPaymentStatus(Order.PaymentStatus.UNPAID);
        order.setLogisticsStatus(Order.LogisticsStatus.PENDING);
        
        // 减少商品库存
        for (OrderItem item : order.getOrderItems()) {
            boolean stockUpdated = productService.updateProductStock(item.getProduct().getId(), item.getQuantity());
            if (!stockUpdated) {
                throw new RuntimeException("商品库存不足: " + item.getProduct().getName());
            }
            item.setOrder(order);
        }
        
        return orderRepository.save(order);
    }
    
    @Override
    @Transactional
    public Order updateOrderStatus(Long orderId, Order.OrderStatus status) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            order.setStatus(status);
            return orderRepository.save(order);
        }
        throw new RuntimeException("订单不存在: " + orderId);
    }
    
    @Override
    @Transactional
    public Order updatePaymentStatus(Long orderId, Order.PaymentStatus paymentStatus) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            order.setPaymentStatus(paymentStatus);
            
            // 如果支付状态变为已支付，同时更新订单状态
            if (paymentStatus == Order.PaymentStatus.PAID) {
                order.setStatus(Order.OrderStatus.PAID);
            }
            
            return orderRepository.save(order);
        }
        throw new RuntimeException("订单不存在: " + orderId);
    }
    
    @Override
    @Transactional
    public Order updateLogisticsStatus(Long orderId, Order.LogisticsStatus logisticsStatus, 
                                      String logisticsCompany, String trackingNumber) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            order.setLogisticsStatus(logisticsStatus);
            order.setLogisticsCompany(logisticsCompany);
            order.setTrackingNumber(trackingNumber);
            
            // 如果物流状态变为已发货，同时更新订单状态
            if (logisticsStatus == Order.LogisticsStatus.SHIPPED) {
                order.setStatus(Order.OrderStatus.SHIPPED);
            }
            
            // 如果物流状态变为已送达，同时更新订单状态
            if (logisticsStatus == Order.LogisticsStatus.DELIVERED) {
                order.setStatus(Order.OrderStatus.DELIVERED);
            }
            
            return orderRepository.save(order);
        }
        throw new RuntimeException("订单不存在: " + orderId);
    }
    
    @Override
    @Transactional
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }
    
    /**
     * 生成唯一的订单号
     */
    private String generateOrderNumber() {
        String timestamp = String.valueOf(System.currentTimeMillis());
        String uuid = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
        return timestamp + uuid;
    }
} 