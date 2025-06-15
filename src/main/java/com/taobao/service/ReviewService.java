package com.taobao.service;

import com.taobao.entity.Customer;
import com.taobao.entity.Product;
import com.taobao.entity.Review;

import java.util.List;
import java.util.Optional;

public interface ReviewService {
    
    List<Review> getAllReviews();
    
    Optional<Review> getReviewById(Long id);
    
    List<Review> getReviewsByProduct(Product product);
    
    List<Review> getReviewsByCustomer(Customer customer);
    
    List<Review> getReviewsByProductOrderByCreatedAtDesc(Product product);
    
    Double getAverageRatingByProduct(Product product);
    
    List<Review> getReviewsByProductAndRating(Product product, Integer rating);
    
    Review saveReview(Review review);
    
    void deleteReview(Long id);
} 