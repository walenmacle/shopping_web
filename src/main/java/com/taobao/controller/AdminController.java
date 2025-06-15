package com.taobao.controller;

import com.taobao.util.DataInitializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/admin")
@CrossOrigin(origins = "*")
public class AdminController {
    
    @Autowired
    private DataInitializer dataInitializer;
    
    @PostMapping("/init-data")
    public ResponseEntity<Map<String, String>> initializeData(@RequestParam(defaultValue = "false") boolean force) {
        try {
            dataInitializer.initializeData(force);
            Map<String, String> response = new HashMap<>();
            response.put("message", "数据初始化完成");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("error", "数据初始化失败: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @PostMapping("/reset-data")
    public ResponseEntity<Map<String, String>> resetData() {
        try {
            // 这里可以添加清空数据的逻辑
            dataInitializer.run();
            Map<String, String> response = new HashMap<>();
            response.put("message", "数据重置完成");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("error", "数据重置失败: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
} 