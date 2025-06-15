package com.taobao.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartSyncRequest {
    private Long productId;
    private Integer quantity;
} 