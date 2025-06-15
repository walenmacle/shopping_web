package com.taobao.repository;

import com.taobao.entity.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SellerRepository extends JpaRepository<Seller, Long> {
    
    Seller findByName(String name);
    
    List<Seller> findByNameContaining(String name);
    
    List<Seller> findByAddressContaining(String address);
    
    List<Seller> findByRatingGreaterThanEqual(Double rating);
} 