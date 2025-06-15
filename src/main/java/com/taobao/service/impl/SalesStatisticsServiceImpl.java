package com.taobao.service.impl;

import com.taobao.entity.Product;
import com.taobao.entity.SalesStatistics;
import com.taobao.entity.Seller;
import com.taobao.repository.SalesStatisticsRepository;
import com.taobao.service.SalesStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class SalesStatisticsServiceImpl implements SalesStatisticsService {
    
    @Autowired
    private SalesStatisticsRepository salesStatisticsRepository;
    
    @Override
    public List<SalesStatistics> getAllSalesStatistics() {
        return salesStatisticsRepository.findAll();
    }
    
    @Override
    public Optional<SalesStatistics> getSalesStatisticsById(Long id) {
        return salesStatisticsRepository.findById(id);
    }
    
    @Override
    public List<SalesStatistics> getSalesStatisticsByProduct(Product product) {
        return salesStatisticsRepository.findByProduct(product);
    }
    
    @Override
    public List<SalesStatistics> getSalesStatisticsBySeller(Seller seller) {
        return salesStatisticsRepository.findBySeller(seller);
    }
    
    @Override
    public List<SalesStatistics> getSalesStatisticsByProductAndDateRange(Product product, Date startDate, Date endDate) {
        return salesStatisticsRepository.findByProductAndDateRange(product, startDate, endDate);
    }
    
    @Override
    public List<SalesStatistics> getSalesStatisticsBySellerAndDateRange(Seller seller, Date startDate, Date endDate) {
        return salesStatisticsRepository.findBySellerAndDateRange(seller, startDate, endDate);
    }
    
    @Override
    public Integer getTotalSalesQuantityByProductAndDateRange(Product product, Date startDate, Date endDate) {
        Integer result = salesStatisticsRepository.getTotalSalesQuantityByProductAndDateRange(product, startDate, endDate);
        return result != null ? result : 0;
    }
    
    @Override
    public Double getTotalSalesAmountBySellerAndDateRange(Seller seller, Date startDate, Date endDate) {
        Double result = salesStatisticsRepository.getTotalSalesAmountBySellerAndDateRange(seller, startDate, endDate);
        return result != null ? result : 0.0;
    }
    
    @Override
    public SalesStatistics saveSalesStatistics(SalesStatistics salesStatistics) {
        return salesStatisticsRepository.save(salesStatistics);
    }
    
    @Override
    public void deleteSalesStatistics(Long id) {
        salesStatisticsRepository.deleteById(id);
    }
} 