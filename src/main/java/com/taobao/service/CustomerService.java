package com.taobao.service;

import com.taobao.entity.Customer;

import java.util.List;
import java.util.Optional;

public interface CustomerService {
    
    List<Customer> getAllCustomers();
    
    Optional<Customer> getCustomerById(Long id);
    
    Optional<Customer> getCustomerByUsername(String username);
    
    Optional<Customer> login(String username, String password);
    
    boolean isUsernameExists(String username);
    
    boolean isEmailExists(String email);
    
    Customer saveCustomer(Customer customer);
    
    void deleteCustomer(Long id);
} 