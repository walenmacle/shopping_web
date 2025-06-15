-- 优化后的数据库初始化脚本
-- 添加更完善的约束、索引和触发器

-- 设置字符集和时区
SET NAMES utf8mb4;
SET time_zone = '+08:00';

-- 创建数据库（如果不存在）
CREATE DATABASE IF NOT EXISTS taobao_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE taobao_db;

-- 删除外键约束检查，清空表
SET FOREIGN_KEY_CHECKS=0;

-- 删除所有表（如果存在）
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS sales_statistics;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sellers;

-- 创建卖家表
CREATE TABLE sellers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    address VARCHAR(500) NOT NULL,
    contact_phone VARCHAR(20),
    contact_email VARCHAR(100),
    license_number VARCHAR(100) NOT NULL UNIQUE,
    rating DECIMAL(3,2) DEFAULT 0.00 CHECK (rating >= 0 AND rating <= 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_seller_name (name),
    INDEX idx_seller_rating (rating),
    INDEX idx_seller_license (license_number)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建客户表
CREATE TABLE customers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_customer_username (username),
    INDEX idx_customer_email (email),
    INDEX idx_customer_phone (phone)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建商品表
CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    image_url VARCHAR(500),
    seller_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES sellers(id) ON DELETE CASCADE,
    INDEX idx_product_name (name),
    INDEX idx_product_price (price),
    INDEX idx_product_seller (seller_id),
    INDEX idx_product_stock (stock),
    FULLTEXT idx_product_search (name, description)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建地址表
CREATE TABLE addresses (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    receiver VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    province VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    detail VARCHAR(500) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    INDEX idx_address_customer (customer_id),
    INDEX idx_address_default (customer_id, is_default)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建购物车表（优化后）
CREATE TABLE cart_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    UNIQUE KEY unique_customer_product (customer_id, product_id),
    INDEX idx_cart_customer (customer_id),
    INDEX idx_cart_product (product_id),
    INDEX idx_cart_updated (updated_at)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建订单表
CREATE TABLE orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    status ENUM('PENDING', 'CONFIRMED', 'SHIPPED', 'DELIVERED', 'CANCELLED') DEFAULT 'PENDING',
    shipping_address TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    INDEX idx_order_customer (customer_id),
    INDEX idx_order_status (status),
    INDEX idx_order_date (created_at)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建订单项表
CREATE TABLE order_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    INDEX idx_order_item_order (order_id),
    INDEX idx_order_item_product (product_id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建评价表
CREATE TABLE reviews (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT NOT NULL,
    customer_id BIGINT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    UNIQUE KEY unique_customer_product_review (customer_id, product_id),
    INDEX idx_review_product (product_id),
    INDEX idx_review_customer (customer_id),
    INDEX idx_review_rating (rating)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建销售统计表
CREATE TABLE sales_statistics (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT NOT NULL,
    sales_date DATE NOT NULL,
    quantity_sold INT NOT NULL DEFAULT 0 CHECK (quantity_sold >= 0),
    revenue DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (revenue >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    UNIQUE KEY unique_product_date (product_id, sales_date),
    INDEX idx_sales_product (product_id),
    INDEX idx_sales_date (sales_date),
    INDEX idx_sales_revenue (revenue)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建购物车同步日志表（新增）
CREATE TABLE cart_sync_logs (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    action ENUM('ADD', 'UPDATE', 'REMOVE', 'SYNC', 'CLEAR') NOT NULL,
    product_id BIGINT,
    quantity INT,
    sync_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL,
    INDEX idx_sync_customer (customer_id),
    INDEX idx_sync_time (sync_time)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 恢复外键约束检查
SET FOREIGN_KEY_CHECKS=1;

-- 创建触发器：自动更新商品评分
DELIMITER //
CREATE TRIGGER update_product_rating 
AFTER INSERT ON reviews 
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(3,2);
    SELECT AVG(rating) INTO avg_rating 
    FROM reviews 
    WHERE product_id = NEW.product_id;
    
    -- 这里可以添加商品评分字段的更新逻辑
    -- UPDATE products SET rating = avg_rating WHERE id = NEW.product_id;
END//

-- 创建触发器：购物车操作日志
CREATE TRIGGER cart_add_log
AFTER INSERT ON cart_items
FOR EACH ROW
BEGIN
    INSERT INTO cart_sync_logs (customer_id, action, product_id, quantity)
    VALUES (NEW.customer_id, 'ADD', NEW.product_id, NEW.quantity);
END//

CREATE TRIGGER cart_update_log
AFTER UPDATE ON cart_items
FOR EACH ROW
BEGIN
    INSERT INTO cart_sync_logs (customer_id, action, product_id, quantity)
    VALUES (NEW.customer_id, 'UPDATE', NEW.product_id, NEW.quantity);
END//

CREATE TRIGGER cart_remove_log
AFTER DELETE ON cart_items
FOR EACH ROW
BEGIN
    INSERT INTO cart_sync_logs (customer_id, action, product_id, quantity)
    VALUES (OLD.customer_id, 'REMOVE', OLD.product_id, OLD.quantity);
END//

DELIMITER ;

-- 添加一些有用的视图
CREATE VIEW customer_cart_summary AS
SELECT 
    c.id as customer_id,
    c.username,
    COUNT(ci.id) as item_count,
    SUM(ci.quantity) as total_quantity,
    SUM(ci.quantity * p.price) as total_amount
FROM customers c
LEFT JOIN cart_items ci ON c.id = ci.customer_id
LEFT JOIN products p ON ci.product_id = p.id
GROUP BY c.id, c.username;

CREATE VIEW product_sales_summary AS
SELECT 
    p.id as product_id,
    p.name,
    p.price,
    p.stock,
    s.name as seller_name,
    COALESCE(SUM(oi.quantity), 0) as total_sold,
    COALESCE(SUM(oi.quantity * oi.price), 0) as total_revenue,
    COALESCE(AVG(r.rating), 0) as avg_rating,
    COUNT(r.id) as review_count
FROM products p
LEFT JOIN sellers s ON p.seller_id = s.id
LEFT JOIN order_items oi ON p.id = oi.product_id
LEFT JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.name, p.price, p.stock, s.name; 