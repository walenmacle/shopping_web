package com.taobao.repository;

import com.taobao.entity.Customer;
import com.taobao.entity.Product;
import com.taobao.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    
    List<Review> findByProduct(Product product);
    
    List<Review> findByCustomer(Customer customer);
    
    List<Review> findByProductOrderByCreatedAtDesc(Product product);
    
    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.product = :product")
    Double getAverageRatingByProduct(@Param("product") Product product);
    
    @Query("SELECT r FROM Review r WHERE r.product = :product AND r.rating = :rating")
    List<Review> findByProductAndRating(@Param("product") Product product, @Param("rating") Integer rating);
} 