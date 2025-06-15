package com.taobao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "addresses")
public class Address {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;
    
    @Column(nullable = false)
    private String receiver;
    
    @Column(nullable = false)
    private String phone;
    
    @Column(nullable = false)
    private String province;
    
    @Column(nullable = false)
    private String city;
    
    @Column(nullable = false)
    private String district;
    
    @Column(nullable = false)
    private String detail;
    
    @Column(name = "is_default")
    private Boolean isDefault = false;
} 