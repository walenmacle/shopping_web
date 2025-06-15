package com.taobao.service;

import com.taobao.entity.Seller;

import java.util.List;
import java.util.Optional;

public interface SellerService {
    
    List<Seller> getAllSellers();
    
    Optional<Seller> getSellerById(Long id);
    
    Seller getSellerByName(String name);
    
    List<Seller> searchSellersByName(String name);
    
    List<Seller> searchSellersByAddress(String address);
    
    List<Seller> getSellersByRatingGreaterThanEqual(Double rating);
    
    Seller saveSeller(Seller seller);
    
    void deleteSeller(Long id);
} 