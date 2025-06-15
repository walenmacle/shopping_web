-- 清空现有商品数据
DELETE FROM order_items;
DELETE FROM reviews;
DELETE FROM sales_statistics;
DELETE FROM products;

-- 插入测试商品数据
INSERT INTO products (name, description, price, stock, image_url, seller_id, created_at, updated_at) VALUES
-- 电子产品
('iPhone 14 Pro 128GB', '最新一代iPhone，A16仿生芯片，Pro级摄像头系统', 7999.00, 100, 'https://via.placeholder.com/400x400?text=iPhone+14+Pro', 1, NOW(), NOW()),
('MacBook Air M2 256GB', '轻薄便携，强劲性能，8核CPU和8核GPU', 9499.00, 50, 'https://via.placeholder.com/400x400?text=MacBook+Air', 8, NOW(), NOW()),
('iPad Pro 11英寸 128GB', '超视网膜XDR显示屏，M2芯片加持', 6799.00, 80, 'https://via.placeholder.com/400x400?text=iPad+Pro', 8, NOW(), NOW()),
('华为P60 Pro', '超聚光夜视长焦，徕卡影像美学', 6988.00, 120, 'https://via.placeholder.com/400x400?text=Huawei+P60', 7, NOW(), NOW()),
('小米13 Ultra', '徕卡光学镜头，骁龙8 Gen 2处理器', 5999.00, 150, 'https://via.placeholder.com/400x400?text=Xiaomi+13', 6, NOW(), NOW()),

-- 服装鞋包
('Nike Air Force 1 白色', '经典百搭小白鞋，舒适透气', 799.00, 200, 'https://via.placeholder.com/400x400?text=Nike+AF1', 11, NOW(), NOW()),
('阿迪达斯运动套装', '三条杠经典设计，运动休闲两相宜', 599.00, 180, 'https://via.placeholder.com/400x400?text=Adidas+Set', 12, NOW(), NOW()),
('优衣库基础款T恤', '纯棉材质，多色可选，简约时尚', 99.00, 500, 'https://via.placeholder.com/400x400?text=Uniqlo+Tshirt', 2, NOW(), NOW()),
('李宁运动鞋', '中国李宁，轻盈回弹，潮流设计', 459.00, 160, 'https://via.placeholder.com/400x400?text=Lining+Shoes', 13, NOW(), NOW()),
('ZARA连衣裙', '欧式简约风格，适合多种场合', 399.00, 100, 'https://via.placeholder.com/400x400?text=ZARA+Dress', 2, NOW(), NOW()),

-- 家居家电
('海尔对开门冰箱', '变频节能，大容量设计，智能控温', 3299.00, 30, 'https://via.placeholder.com/400x400?text=Haier+Fridge', 16, NOW(), NOW()),
('美的空调 1.5匹', '变频节能，快速制冷，静音运行', 2199.00, 40, 'https://via.placeholder.com/400x400?text=Midea+AC', 17, NOW(), NOW()),
('格力空调扇', '无叶设计，自然风感，遥控操作', 899.00, 80, 'https://via.placeholder.com/400x400?text=Gree+Fan', 18, NOW(), NOW()),
('小熊电饭煲', '智能预约，多功能蒸煮，家庭首选', 299.00, 120, 'https://via.placeholder.com/400x400?text=Bear+Cooker', 20, NOW(), NOW()),
('宜家沙发', '北欧简约风格，舒适耐用，多色可选', 1999.00, 25, 'https://via.placeholder.com/400x400?text=IKEA+Sofa', 2, NOW(), NOW()),

-- 美妆护肤
('雅诗兰黛小棕瓶', '修护精华，改善肌肤状态', 580.00, 200, 'https://via.placeholder.com/400x400?text=Estee+Lauder', 2, NOW(), NOW()),
('兰蔻粉水', '保湿爽肤水，温和不刺激', 390.00, 150, 'https://via.placeholder.com/400x400?text=Lancome+Toner', 2, NOW(), NOW()),
('SK-II神仙水', '经典护肤精华，改善肌肤质地', 1080.00, 80, 'https://via.placeholder.com/400x400?text=SKII+Essence', 2, NOW(), NOW()),
('YSL口红', '经典色号，持久显色，奢华包装', 320.00, 300, 'https://via.placeholder.com/400x400?text=YSL+Lipstick', 2, NOW(), NOW()),
('完美日记眼影盘', '多色搭配，持久不脱妆', 89.00, 400, 'https://via.placeholder.com/400x400?text=Perfect+Diary', 2, NOW(), NOW()),

-- 食品饮料
('三只松鼠坚果礼盒', '精选优质坚果，营养健康零食', 128.00, 300, 'https://via.placeholder.com/400x400?text=Three+Squirrels', 4, NOW(), NOW()),
('良品铺子零食大礼包', '多种口味，满足不同需求', 199.00, 200, 'https://via.placeholder.com/400x400?text=Bestore+Pack', 4, NOW(), NOW()),
('元气森林气泡水', '0糖0脂0卡，健康饮品首选', 65.00, 500, 'https://via.placeholder.com/400x400?text=Genki+Water', 4, NOW(), NOW()),
('喜茶茶包礼盒', '精选茶叶，多种口味可选', 158.00, 150, 'https://via.placeholder.com/400x400?text=Heytea+Box', 4, NOW(), NOW()),
('百草味肉脯', '精选肉质，独特调味，美味可口', 35.00, 400, 'https://via.placeholder.com/400x400?text=BCW+Jerky', 4, NOW(), NOW()),

-- 运动户外
('keep瑜伽垫', '防滑设计，环保材质，适合家庭运动', 189.00, 200, 'https://via.placeholder.com/400x400?text=Keep+Mat', 11, NOW(), NOW()),
('迪卡侬运动水杯', '大容量设计，便携实用', 29.00, 300, 'https://via.placeholder.com/400x400?text=Decathlon+Bottle', 11, NOW(), NOW()),
('哑铃套装', '可调节重量，家庭健身必备', 299.00, 100, 'https://via.placeholder.com/400x400?text=Dumbbell+Set', 11, NOW(), NOW()),
('户外登山包', '大容量设计，多口袋分层', 399.00, 80, 'https://via.placeholder.com/400x400?text=Hiking+Bag', 14, NOW(), NOW()),
('速干T恤', '吸湿排汗，户外运动首选', 79.00, 250, 'https://via.placeholder.com/400x400?text=Quick+Dry+Tee', 15, NOW(), NOW()),

-- 图书文具
('经典文学套装', '四大名著，精装收藏版', 158.00, 100, 'https://via.placeholder.com/400x400?text=Classic+Books', 3, NOW(), NOW()),
('儿童绘本套装', '启发想象力，亲子阅读首选', 99.00, 200, 'https://via.placeholder.com/400x400?text=Kids+Books', 3, NOW(), NOW()),
('办公文具套装', '笔记本、钢笔、便签等办公用品', 89.00, 150, 'https://via.placeholder.com/400x400?text=Office+Set', 3, NOW(), NOW()),
('学生书包', '减负设计，大容量，护脊背负', 199.00, 120, 'https://via.placeholder.com/400x400?text=School+Bag', 3, NOW(), NOW()),
('艺术绘画套装', '专业画笔、颜料、画板', 299.00, 80, 'https://via.placeholder.com/400x400?text=Art+Set', 3, NOW(), NOW());

-- 确保每个商家都有商品
-- 为没有商品的商家添加一些商品
INSERT INTO products (name, description, price, stock, image_url, seller_id, created_at, updated_at) VALUES
('拼多多特价商品', '限时特价，品质保证', 49.90, 1000, 'https://via.placeholder.com/400x400?text=PDD+Special', 4, NOW(), NOW()),
('唯品会精选好物', '品牌特卖，正品保障', 199.00, 500, 'https://via.placeholder.com/400x400?text=VIP+Select', 5, NOW(), NOW()),
('OPPO Reno9', '人像摄影，轻薄设计', 2499.00, 100, 'https://via.placeholder.com/400x400?text=OPPO+Reno9', 10, NOW(), NOW()),
('方太油烟机', '大吸力，低噪音，厨房必备', 2999.00, 50, 'https://via.placeholder.com/400x400?text=Fotile+Hood', 19, NOW(), NOW());

-- 验证插入结果
SELECT COUNT(*) as product_count FROM products;
SELECT s.name as seller_name, COUNT(p.id) as product_count 
FROM sellers s 
LEFT JOIN products p ON s.id = p.seller_id 
GROUP BY s.id, s.name 
ORDER BY s.id; 