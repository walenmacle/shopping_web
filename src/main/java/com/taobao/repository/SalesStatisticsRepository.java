package com.taobao.repository;

import com.taobao.entity.Product;
import com.taobao.entity.SalesStatistics;
import com.taobao.entity.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface SalesStatisticsRepository extends JpaRepository<SalesStatistics, Long> {
    
    List<SalesStatistics> findByProduct(Product product);
    
    List<SalesStatistics> findBySeller(Seller seller);
    
    @Query("SELECT s FROM SalesStatistics s WHERE s.product = :product AND s.statisticsDate BETWEEN :startDate AND :endDate ORDER BY s.statisticsDate")
    List<SalesStatistics> findByProductAndDateRange(@Param("product") Product product, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
    
    @Query("SELECT s FROM SalesStatistics s WHERE s.seller = :seller AND s.statisticsDate BETWEEN :startDate AND :endDate ORDER BY s.statisticsDate")
    List<SalesStatistics> findBySellerAndDateRange(@Param("seller") Seller seller, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
    
    @Query("SELECT SUM(s.salesQuantity) FROM SalesStatistics s WHERE s.product = :product AND s.statisticsDate BETWEEN :startDate AND :endDate")
    Integer getTotalSalesQuantityByProductAndDateRange(@Param("product") Product product, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
    
    @Query("SELECT SUM(s.salesAmount) FROM SalesStatistics s WHERE s.seller = :seller AND s.statisticsDate BETWEEN :startDate AND :endDate")
    Double getTotalSalesAmountBySellerAndDateRange(@Param("seller") Seller seller, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
} 