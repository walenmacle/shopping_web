package com.taobao.service;

import com.taobao.entity.Product;
import com.taobao.entity.SalesStatistics;
import com.taobao.entity.Seller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface SalesStatisticsService {
    
    List<SalesStatistics> getAllSalesStatistics();
    
    Optional<SalesStatistics> getSalesStatisticsById(Long id);
    
    List<SalesStatistics> getSalesStatisticsByProduct(Product product);
    
    List<SalesStatistics> getSalesStatisticsBySeller(Seller seller);
    
    List<SalesStatistics> getSalesStatisticsByProductAndDateRange(Product product, Date startDate, Date endDate);
    
    List<SalesStatistics> getSalesStatisticsBySellerAndDateRange(Seller seller, Date startDate, Date endDate);
    
    Integer getTotalSalesQuantityByProductAndDateRange(Product product, Date startDate, Date endDate);
    
    Double getTotalSalesAmountBySellerAndDateRange(Seller seller, Date startDate, Date endDate);
    
    SalesStatistics saveSalesStatistics(SalesStatistics salesStatistics);
    
    void deleteSalesStatistics(Long id);
} 