package com.taobao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "order_number", nullable = false, unique = true)
    private String orderNumber;
    
    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;
    
    @ManyToOne
    @JoinColumn(name = "seller_id", nullable = false)
    private Seller seller;
    
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<OrderItem> orderItems;
    
    @Column(name = "total_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount;
    
    @ManyToOne
    @JoinColumn(name = "shipping_address_id", nullable = false)
    private Address shippingAddress;
    
    @Column(name = "order_status", nullable = false)
    @Enumerated(EnumType.STRING)
    private OrderStatus status;
    
    @Column(name = "payment_status", nullable = false)
    @Enumerated(EnumType.STRING)
    private PaymentStatus paymentStatus;
    
    @Column(name = "logistics_status", nullable = false)
    @Enumerated(EnumType.STRING)
    private LogisticsStatus logisticsStatus;
    
    @Column(name = "logistics_company")
    private String logisticsCompany;
    
    @Column(name = "tracking_number")
    private String trackingNumber;
    
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
        updatedAt = new Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }
    
    public enum OrderStatus {
        PENDING, PAID, SHIPPED, DELIVERED, CANCELED, COMPLETED
    }
    
    public enum PaymentStatus {
        UNPAID, PAID, REFUNDED
    }
    
    public enum LogisticsStatus {
        PENDING, PROCESSING, SHIPPED, DELIVERED
    }
} 