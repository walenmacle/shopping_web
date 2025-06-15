package com.taobao.service.impl;

import com.taobao.entity.Seller;
import com.taobao.repository.SellerRepository;
import com.taobao.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SellerServiceImpl implements SellerService {
    
    @Autowired
    private SellerRepository sellerRepository;
    
    @Override
    public List<Seller> getAllSellers() {
        return sellerRepository.findAll();
    }
    
    @Override
    public Optional<Seller> getSellerById(Long id) {
        return sellerRepository.findById(id);
    }
    
    @Override
    public Seller getSellerByName(String name) {
        return sellerRepository.findByName(name);
    }
    
    @Override
    public List<Seller> searchSellersByName(String name) {
        return sellerRepository.findByNameContaining(name);
    }
    
    @Override
    public List<Seller> searchSellersByAddress(String address) {
        return sellerRepository.findByAddressContaining(address);
    }
    
    @Override
    public List<Seller> getSellersByRatingGreaterThanEqual(Double rating) {
        return sellerRepository.findByRatingGreaterThanEqual(rating);
    }
    
    @Override
    public Seller saveSeller(Seller seller) {
        return sellerRepository.save(seller);
    }
    
    @Override
    public void deleteSeller(Long id) {
        sellerRepository.deleteById(id);
    }
} 