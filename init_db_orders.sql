-- 插入订单数据
-- 状态: PENDING=待付款, PAID=已付款待发货, SHIPPED=已发货待收货, COMPLETED=已完成, CANCELED=已取消
INSERT INTO orders (customer_id, seller_id, order_number, order_status, payment_status, logistics_status, total_amount, shipping_address_id, created_at, updated_at) VALUES
(1, 8, 'ORD20230101001', 'COMPLETED', 'PAID', 'DELIVERED', 9098.00, 1, '2023-01-01 10:00:00', '2023-01-05 15:30:00'),
(2, 8, 'ORD20230102001', 'COMPLETED', 'PAID', 'DELIVERED', 7999.00, 2, '2023-01-02 11:20:00', '2023-01-06 16:40:00'),
(3, 8, 'ORD20230103001', 'COMPLETED', 'PAID', 'DELIVERED', 5999.00, 3, '2023-01-03 09:15:00', '2023-01-07 14:20:00'),
(4, 8, 'ORD20230104001', 'COMPLETED', 'PAID', 'DELIVERED', 1999.00, 4, '2023-01-04 14:30:00', '2023-01-08 18:10:00'),
(5, 8, 'ORD20230105001', 'COMPLETED', 'PAID', 'DELIVERED', 2999.00, 5, '2023-01-05 16:45:00', '2023-01-09 11:30:00'),
(6, 9, 'ORD20230106001', 'COMPLETED', 'PAID', 'DELIVERED', 6999.00, 6, '2023-01-06 10:20:00', '2023-01-10 15:45:00'),
(7, 9, 'ORD20230107001', 'COMPLETED', 'PAID', 'DELIVERED', 7999.00, 7, '2023-01-07 13:40:00', '2023-01-11 17:20:00'),
(8, 9, 'ORD20230108001', 'COMPLETED', 'PAID', 'DELIVERED', 4999.00, 8, '2023-01-08 15:10:00', '2023-01-12 10:30:00'),
(9, 9, 'ORD20230109001', 'COMPLETED', 'PAID', 'DELIVERED', 999.00, 9, '2023-01-09 09:30:00', '2023-01-13 14:15:00'),
(10, 9, 'ORD20230110001', 'COMPLETED', 'PAID', 'DELIVERED', 1999.00, 10, '2023-01-10 11:50:00', '2023-01-14 16:40:00'),
(1, 7, 'ORD20230201001', 'COMPLETED', 'PAID', 'DELIVERED', 5999.00, 1, '2023-02-01 10:30:00', '2023-02-05 15:40:00'),
(2, 7, 'ORD20230202001', 'COMPLETED', 'PAID', 'DELIVERED', 8999.00, 2, '2023-02-02 14:20:00', '2023-02-06 18:30:00'),
(3, 7, 'ORD20230203001', 'COMPLETED', 'PAID', 'DELIVERED', 2199.00, 3, '2023-02-03 16:10:00', '2023-02-07 11:20:00'),
(4, 7, 'ORD20230204001', 'COMPLETED', 'PAID', 'DELIVERED', 999.00, 4, '2023-02-04 09:45:00', '2023-02-08 14:30:00'),
(5, 7, 'ORD20230205001', 'COMPLETED', 'PAID', 'DELIVERED', 1299.00, 5, '2023-02-05 13:15:00', '2023-02-09 17:45:00'),
(1, 6, 'ORD20230301001', 'PAID', 'PAID', 'PENDING', 3999.00, 1, '2023-03-01 14:30:00', '2023-03-01 14:30:00'),
(2, 6, 'ORD20230302001', 'SHIPPED', 'PAID', 'SHIPPED', 4699.00, 2, '2023-03-02 16:20:00', '2023-03-02 16:20:00'),
(3, 6, 'ORD20230303001', 'SHIPPED', 'PAID', 'SHIPPED', 1999.00, 3, '2023-03-03 10:15:00', '2023-03-03 10:15:00'),
(4, 6, 'ORD20230304001', 'PAID', 'PAID', 'PENDING', 649.00, 4, '2023-03-04 11:40:00', '2023-03-04 11:40:00'),
(5, 6, 'ORD20230305001', 'PENDING', 'PENDING', 'PENDING', 279.00, 5, '2023-03-05 15:30:00', '2023-03-05 15:30:00');

-- 插入订单项数据
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES
(1, 1, 1, 8999.00, 8999.00),
(1, 4, 1, 99.00, 99.00),
(2, 2, 1, 7999.00, 7999.00),
(3, 3, 1, 5999.00, 5999.00),
(4, 4, 1, 1999.00, 1999.00),
(5, 5, 1, 2999.00, 2999.00),
(6, 6, 1, 6999.00, 6999.00),
(7, 7, 1, 7999.00, 7999.00),
(8, 8, 1, 4999.00, 4999.00),
(9, 9, 1, 999.00, 999.00),
(10, 10, 1, 1999.00, 1999.00),
(11, 11, 1, 5999.00, 5999.00),
(12, 12, 1, 8999.00, 8999.00),
(13, 13, 1, 2199.00, 2199.00),
(14, 14, 1, 999.00, 999.00),
(15, 15, 1, 1299.00, 1299.00),
(16, 16, 1, 3999.00, 3999.00),
(17, 17, 1, 4699.00, 4699.00),
(18, 18, 1, 1999.00, 1999.00),
(19, 19, 1, 649.00, 649.00),
(20, 20, 1, 279.00, 279.00);

-- 插入评论数据
INSERT INTO reviews (customer_id, product_id, rating, comment, created_at) VALUES
(1, 1, 5, '非常满意，手机质量很好，外观漂亮，性能强劲，相机效果出色，续航也很好！', '2023-01-06 10:20:00'),
(2, 2, 5, '笔记本轻薄美观，性能强大，散热不错，屏幕显示效果好，续航能力强，非常满意！', '2023-01-07 14:30:00'),
(3, 3, 4, '平板画质不错，声音清晰，触控灵敏，但续航时间略短，整体使用体验良好。', '2023-01-08 16:40:00'),
(4, 4, 5, '耳机音质出众，降噪效果好，佩戴舒适，续航也很强，充电速度快，推荐购买！', '2023-01-09 09:15:00'),
(5, 5, 4, '手表功能齐全，显示清晰，佩戴舒适，电池续航一般，整体来说是不错的产品。', '2023-01-10 11:30:00'),
(6, 6, 5, '手机很好，性价比高，运行速度快，拍照效果好，续航时间长，外观也很漂亮！', '2023-01-11 15:45:00'),
(7, 7, 4, '笔记本做工精良，性能强劲，屏幕显示效果佳，但运行大型软件时有轻微发热现象。', '2023-01-12 17:20:00'),
(8, 8, 5, '平板分辨率高，运行流畅，触控灵敏，重量适中，携带方便，非常满意！', '2023-01-13 10:30:00'),
(9, 9, 5, '耳机音质清晰，佩戴舒适，降噪效果好，续航强大，性价比高，值得购买！', '2023-01-14 14:15:00'),
(10, 10, 4, '手表功能实用，设计时尚，佩戴舒适，但健康监测功能还可以再完善一些。', '2023-01-15 16:40:00'),
(1, 11, 5, '手机拍照效果好，反应速度快，外观漂亮，续航持久，性价比高，很满意！', '2023-02-06 10:30:00'),
(2, 12, 5, '笔记本轻薄美观，性能强大，散热好，屏幕效果佳，触控板敏感，使用体验极佳！', '2023-02-07 14:20:00'),
(3, 13, 4, '平板分辨率高，色彩鲜艳，游戏流畅，但偶有轻微卡顿，整体来说是好产品。', '2023-02-08 16:10:00'),
(4, 14, 5, '耳机降噪效果好，音质清晰，佩戴舒适，续航时间长，充电速度快，很满意！', '2023-02-09 09:45:00'),
(5, 15, 4, '手表外观时尚，功能实用，续航持久，但健康监测数据精度还可以提高。', '2023-02-10 13:15:00'); 