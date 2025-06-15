-- 关闭外键检查
SET FOREIGN_KEY_CHECKS = 0;

-- 清空所有表
TRUNCATE TABLE reviews;
TRUNCATE TABLE order_items;
TRUNCATE TABLE orders;
TRUNCATE TABLE products;
TRUNCATE TABLE addresses;
TRUNCATE TABLE customers;
TRUNCATE TABLE sellers;

-- 引入所有初始化脚本
source init_db.sql;
source init_db_products.sql;
source init_db_orders.sql;

-- 打开外键检查
SET FOREIGN_KEY_CHECKS = 1;

-- 显示导入结果
SELECT 'Sellers' AS table_name, COUNT(*) AS count FROM sellers
UNION
SELECT 'Customers', COUNT(*) FROM customers
UNION
SELECT 'Addresses', COUNT(*) FROM addresses
UNION
SELECT 'Products', COUNT(*) FROM products
UNION
SELECT 'Orders', COUNT(*) FROM orders
UNION
SELECT 'Order Items', COUNT(*) FROM order_items
UNION
SELECT 'Reviews', COUNT(*) FROM reviews;

-- 初始化成功消息
SELECT 'Database initialization completed successfully!' AS message; 