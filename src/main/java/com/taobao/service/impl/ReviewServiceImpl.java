package com.taobao.service.impl;

import com.taobao.entity.Customer;
import com.taobao.entity.Product;
import com.taobao.entity.Review;
import com.taobao.repository.ReviewRepository;
import com.taobao.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReviewServiceImpl implements ReviewService {
    
    @Autowired
    private ReviewRepository reviewRepository;
    
    @Override
    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }
    
    @Override
    public Optional<Review> getReviewById(Long id) {
        return reviewRepository.findById(id);
    }
    
    @Override
    public List<Review> getReviewsByProduct(Product product) {
        return reviewRepository.findByProduct(product);
    }
    
    @Override
    public List<Review> getReviewsByCustomer(Customer customer) {
        return reviewRepository.findByCustomer(customer);
    }
    
    @Override
    public List<Review> getReviewsByProductOrderByCreatedAtDesc(Product product) {
        return reviewRepository.findByProductOrderByCreatedAtDesc(product);
    }
    
    @Override
    public Double getAverageRatingByProduct(Product product) {
        return reviewRepository.getAverageRatingByProduct(product);
    }
    
    @Override
    public List<Review> getReviewsByProductAndRating(Product product, Integer rating) {
        return reviewRepository.findByProductAndRating(product, rating);
    }
    
    @Override
    public Review saveReview(Review review) {
        return reviewRepository.save(review);
    }
    
    @Override
    public void deleteReview(Long id) {
        reviewRepository.deleteById(id);
    }
} 