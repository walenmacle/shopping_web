-- 优化后的数据初始化脚本
USE taobao_db;

-- 清空现有数据
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE cart_sync_logs;
TRUNCATE TABLE cart_items;
TRUNCATE TABLE order_items;
TRUNCATE TABLE orders;
TRUNCATE TABLE reviews;
TRUNCATE TABLE sales_statistics;
TRUNCATE TABLE addresses;
TRUNCATE TABLE products;
TRUNCATE TABLE customers;
TRUNCATE TABLE sellers;
SET FOREIGN_KEY_CHECKS=1;

-- 插入卖家数据
INSERT INTO sellers (name, description, address, contact_phone, contact_email, license_number, rating) VALUES
('京东自营', '官方授权，正品保障，售后无忧', '北京市朝阳区大望路XX号', '13800138001', 'jd@example.com', 'L123456', 4.8),
('天猫官方旗舰店', '品牌直营，价格优惠，服务一流', '浙江省杭州市西湖区余杭塘路866号', '13800138002', 'tmall@example.com', 'L234567', 4.9),
('苏宁易购', '专业经营10年，信誉保证', '江苏省南京市玄武区苏宁大道1号', '13800138003', 'suning@example.com', 'L345678', 4.7),
('拼多多', '全场包邮，七天无理由退换', '上海市黄浦区淮海中路999号', '13800138004', 'pdd@example.com', 'L456789', 4.5),
('唯品会', '大型连锁，覆盖全国，就近发货', '广东省广州市天河区珠江新城', '13800138005', 'vip@example.com', 'L567890', 4.6),
('小米官方旗舰店', '厂家直销，没有中间商赚差价', '北京市海淀区清河中街68号', '13800138006', 'mi@example.com', 'L678901', 4.9),
('华为授权店', '线上线下同步，体验更佳', '广东省深圳市龙岗区坂田街道', '13800138007', 'huawei@example.com', 'L789012', 4.8),
('Apple专卖店', '专注品质，用心服务每一位顾客', '上海市徐汇区肇嘉浜路333号', '13800138008', 'apple@example.com', 'L890123', 4.9),
('三星官方旗舰店', '创立于2010年，业内领先品牌', '北京市朝阳区东三环中路55号', '13800138009', 'samsung@example.com', 'L901234', 4.7),
('OPPO官方旗舰店', '新店开业，优惠多多，欢迎惠顾', '广东省东莞市长安镇乌沙村', '13800138010', 'oppo@example.com', 'L012345', 4.8);

-- 插入客户数据
INSERT INTO customers (username, password, name, email, phone) VALUES
('admin', 'admin123', '管理员', 'admin@taobao.com', '13900138888'),
('testuser', 'password123', '测试用户', 'test@example.com', '13900139001'),
('zhangsan', 'pass123', '张三', 'zhangsan@example.com', '13900139002'),
('lisi', 'pass123', '李四', 'lisi@example.com', '13900139003'),
('wangwu', 'pass123', '王五', 'wangwu@example.com', '13900139004'),
('zhaoliu', 'pass123', '赵六', 'zhaoliu@example.com', '13900139005'),
('qianqi', 'pass123', '钱七', 'qianqi@example.com', '13900139006'),
('sunba', 'pass123', '孙八', 'sunba@example.com', '13900139007'),
('zhoujiu', 'pass123', '周九', 'zhoujiu@example.com', '13900139008'),
('wushi', 'pass123', '吴十', 'wushi@example.com', '13900139009');

-- 插入商品数据
INSERT INTO products (name, description, price, stock, image_url, seller_id) VALUES
-- 小米商品
('小米13 Pro', '骁龙8 Gen2处理器，徕卡影像系统，120W快充', 4299.00, 100, '/images/xiaomi13pro.jpg', 6),
('小米笔记本Pro 15', '12代酷睿i7，RTX 3050Ti，3.2K OLED屏', 6999.00, 50, '/images/xiaomi-laptop.jpg', 6),
('小米手环8', '1.62英寸AMOLED屏，150+运动模式，16天续航', 299.00, 200, '/images/miband8.jpg', 6),

-- 华为商品
('华为P60 Pro', '骁龙8+ Gen1，长焦微距镜头，鸿蒙3.1', 6988.00, 80, '/images/huawei-p60.jpg', 7),
('华为MateBook X Pro', '12代酷睿i7，3K触控屏，雷电4接口', 8999.00, 30, '/images/huawei-laptop.jpg', 7),
('华为Watch GT 4', '智能运动手表，健康监测，14天续航', 1288.00, 150, '/images/huawei-watch.jpg', 7),

-- Apple商品
('iPhone 15 Pro', 'A17 Pro芯片，钛金属设计，USB-C接口', 7999.00, 120, '/images/iphone15pro.jpg', 8),
('MacBook Air M2', 'M2芯片，13.6英寸液晶屏，18小时续航', 8999.00, 60, '/images/macbook-air.jpg', 8),
('AirPods Pro 2', '主动降噪，空间音频，MagSafe充电盒', 1899.00, 180, '/images/airpods-pro.jpg', 8),

-- 三星商品
('三星Galaxy S23 Ultra', '骁龙8 Gen2，200MP相机，S Pen支持', 7699.00, 90, '/images/samsung-s23.jpg', 9),
('三星显示器28寸4K', 'UHD分辨率，HDR10支持，USB-C一线连', 2199.00, 70, '/images/samsung-monitor.jpg', 9),

-- 京东自营
('戴尔XPS 13', '12代酷睿i7，InfinityEdge屏幕', 7999.00, 40, '/images/dell-xps13.jpg', 1),
('索尼WH-1000XM5', '业界领先降噪，30小时续航', 2399.00, 100, '/images/sony-headphones.jpg', 1),

-- 天猫商品
('耐克Air Max 270', '经典气垫跑鞋，透气网面设计', 899.00, 150, '/images/nike-airmax.jpg', 2),
('阿迪达斯三叶草', '经典三条杠，复古运动风格', 699.00, 200, '/images/adidas-classic.jpg', 2),

-- 苏宁易购
('海尔冰箱 BCD-318', '318L大容量，变频节能，双开门', 2599.00, 25, '/images/haier-fridge.jpg', 3),
('美的空调 1.5匹', '变频节能，智能控制，静音运行', 2299.00, 35, '/images/midea-ac.jpg', 3);

-- 插入地址数据
INSERT INTO addresses (customer_id, receiver, phone, province, city, district, detail, is_default) VALUES
(1, '管理员', '13900138888', '北京市', '北京市', '朝阳区', '朝阳路123号', true),
(2, '测试用户', '13900139001', '上海市', '上海市', '浦东新区', '世纪大道456号', true),
(3, '张三', '13900139002', '广东省', '深圳市', '南山区', '科技园路789号', true),
(4, '李四', '13900139003', '江苏省', '南京市', '鼓楼区', '中央路321号', true),
(5, '王五', '13900139004', '浙江省', '杭州市', '西湖区', '文三路654号', true),
(6, '赵六', '13900139005', '四川省', '成都市', '锦江区', '春熙路987号', true),
(7, '钱七', '13900139006', '湖北省', '武汉市', '洪山区', '光谷大道147号', true),
(8, '孙八', '13900139007', '湖南省', '长沙市', '岳麓区', '麓山路258号', true),
(9, '周九', '13900139008', '河南省', '郑州市', '金水区', '文化路369号', true),
(10, '吴十', '13900139009', '河北省', '石家庄市', '长安区', '中山路741号', true);

-- 插入一些购物车数据（模拟用户已添加商品到购物车）
INSERT INTO cart_items (customer_id, product_id, quantity) VALUES
(2, 1, 1),  -- 测试用户添加小米13 Pro
(2, 3, 2),  -- 测试用户添加2个小米手环8
(3, 4, 1),  -- 张三添加华为P60 Pro
(3, 7, 1),  -- 张三添加iPhone 15 Pro
(4, 2, 1),  -- 李四添加小米笔记本Pro 15
(4, 6, 1),  -- 李四添加华为Watch GT 4
(5, 9, 1),  -- 王五添加AirPods Pro 2
(5, 13, 2), -- 王五添加2双耐克鞋
(6, 10, 1), -- 赵六添加三星Galaxy S23 Ultra
(7, 15, 1); -- 钱七添加海尔冰箱

-- 插入一些订单数据
INSERT INTO orders (customer_id, total_amount, status, shipping_address) VALUES
(3, 4299.00, 'DELIVERED', '广东省深圳市南山区科技园路789号'),
(4, 2399.00, 'SHIPPED', '江苏省南京市鼓楼区中央路321号'),
(5, 899.00, 'CONFIRMED', '浙江省杭州市西湖区文三路654号'),
(6, 7699.00, 'PENDING', '四川省成都市锦江区春熙路987号');

-- 插入订单项数据
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 4299.00),  -- 张三购买的小米13 Pro
(2, 12, 1, 2399.00), -- 李四购买的索尼耳机
(3, 13, 1, 899.00),  -- 王五购买的耐克鞋
(4, 10, 1, 7699.00); -- 赵六购买的三星S23 Ultra

-- 插入一些评价数据
INSERT INTO reviews (product_id, customer_id, rating, comment) VALUES
(1, 3, 5, '手机性能很棒，拍照效果超级好！'),
(12, 4, 4, '音质不错，降噪效果很好，就是价格有点贵'),
(13, 5, 5, '很舒适的跑鞋，性价比很高'),
(1, 2, 4, '整体不错，就是发热有点明显'),
(3, 6, 5, '手环功能很全，续航时间长，很满意');

-- 插入销售统计数据
INSERT INTO sales_statistics (product_id, sales_date, quantity_sold, revenue) VALUES
(1, '2024-01-15', 5, 21495.00),
(3, '2024-01-15', 10, 2990.00),
(4, '2024-01-16', 3, 20964.00),
(7, '2024-01-16', 2, 15998.00),
(13, '2024-01-17', 8, 7192.00),
(12, '2024-01-17', 4, 9596.00),
(10, '2024-01-18', 2, 15398.00),
(15, '2024-01-18', 1, 2599.00);

-- 验证数据完整性
SELECT 'sellers' as table_name, COUNT(*) as count FROM sellers
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'addresses', COUNT(*) FROM addresses
UNION ALL
SELECT 'cart_items', COUNT(*) FROM cart_items
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'sales_statistics', COUNT(*) FROM sales_statistics;

-- 显示购物车摘要
SELECT * FROM customer_cart_summary WHERE item_count > 0;

-- 显示商品销售摘要
SELECT * FROM product_sales_summary LIMIT 10;

-- 查看购物车数据
SELECT c.username, p.name, ci.quantity 
FROM cart_items ci
JOIN customers c ON ci.customer_id = c.id
JOIN products p ON ci.product_id = p.id;

-- 查看购物车操作日志
SELECT c.username, csl.action, csl.sync_time
FROM cart_sync_logs csl
JOIN customers c ON csl.customer_id = c.id
ORDER BY csl.sync_time DESC; 