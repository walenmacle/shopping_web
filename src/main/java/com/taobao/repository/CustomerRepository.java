package com.taobao.repository;

import com.taobao.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    
    Optional<Customer> findByUsername(String username);
    
    Optional<Customer> findByUsernameAndPassword(String username, String password);
    
    boolean existsByUsername(String username);
    
    boolean existsByEmail(String email);
} 