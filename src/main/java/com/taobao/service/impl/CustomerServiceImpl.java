package com.taobao.service.impl;

import com.taobao.entity.Customer;
import com.taobao.repository.CustomerRepository;
import com.taobao.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerServiceImpl implements CustomerService {
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Override
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }
    
    @Override
    public Optional<Customer> getCustomerById(Long id) {
        return customerRepository.findById(id);
    }
    
    @Override
    public Optional<Customer> getCustomerByUsername(String username) {
        return customerRepository.findByUsername(username);
    }
    
    @Override
    public Optional<Customer> login(String username, String password) {
        return customerRepository.findByUsernameAndPassword(username, password);
    }
    
    @Override
    public boolean isUsernameExists(String username) {
        return customerRepository.existsByUsername(username);
    }
    
    @Override
    public boolean isEmailExists(String email) {
        return customerRepository.existsByEmail(email);
    }
    
    @Override
    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }
    
    @Override
    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }
} 