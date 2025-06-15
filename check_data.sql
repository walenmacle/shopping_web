-- 检查卖家数据
SELECT COUNT(*) AS seller_count FROM sellers;
SELECT id, name, contact_phone, contact_email FROM sellers LIMIT 5;

-- 检查客户数据
SELECT COUNT(*) AS customer_count FROM customers;
SELECT id, username, name, email FROM customers LIMIT 5;

-- 检查地址数据
SELECT COUNT(*) AS address_count FROM addresses;
SELECT id, customer_id, province, city, district, detail FROM addresses LIMIT 5;

-- 检查产品数据
SELECT COUNT(*) AS product_count FROM products;
SELECT id, name, price, stock, seller_id FROM products LIMIT 10;

-- 检查订单数据
SELECT COUNT(*) AS order_count FROM orders;
SELECT id, customer_id, seller_id, order_number, order_status, payment_status, total_amount FROM orders LIMIT 10;

-- 检查订单项数据
SELECT COUNT(*) AS order_item_count FROM order_items;
SELECT id, order_id, product_id, quantity, unit_price, subtotal FROM order_items LIMIT 10;

-- 检查评论数据
SELECT COUNT(*) AS review_count FROM reviews;
SELECT id, customer_id, product_id, rating, SUBSTRING(comment, 1, 30) AS comment_preview FROM reviews LIMIT 10; 