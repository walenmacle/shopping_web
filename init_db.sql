-- 清空表（如果有数据）
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE addresses;
TRUNCATE TABLE customers;
TRUNCATE TABLE orders;
TRUNCATE TABLE order_items;
TRUNCATE TABLE products;
TRUNCATE TABLE reviews;
TRUNCATE TABLE sales_statistics;
TRUNCATE TABLE sellers;
SET FOREIGN_KEY_CHECKS=1;

-- 创建卖家数据
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
('OPPO官方旗舰店', '新店开业，优惠多多，欢迎惠顾', '广东省东莞市长安镇乌沙村', '13800138010', 'oppo@example.com', 'L012345', 4.8),
('耐克官方店', '官方授权，正品保障，售后无忧', '上海市静安区南京西路1038号', '13800138011', 'nike@example.com', 'L123457', 4.7),
('阿迪达斯旗舰店', '品牌直营，价格优惠，服务一流', '北京市西城区西单北大街120号', '13800138012', 'adidas@example.com', 'L234568', 4.8),
('李宁官方旗舰店', '专业经营10年，信誉保证', '上海市浦东新区世纪大道100号', '13800138013', 'lining@example.com', 'L345679', 4.6),
('安德玛专卖店', '全场包邮，七天无理由退换', '广东省深圳市南山区科技园路', '13800138014', 'ua@example.com', 'L456780', 4.5),
('彪马旗舰店', '大型连锁，覆盖全国，就近发货', '江苏省南京市建邺区嘉陵江东街', '13800138015', 'puma@example.com', 'L567891', 4.7),
('海尔电器旗舰店', '厂家直销，没有中间商赚差价', '山东省青岛市崂山区海尔路', '13800138016', 'haier@example.com', 'L678902', 4.8),
('美的电器官方店', '线上线下同步，体验更佳', '广东省佛山市顺德区北滘镇', '13800138017', 'midea@example.com', 'L789013', 4.7),
('格力空调专卖店', '专注品质，用心服务每一位顾客', '广东省珠海市香洲区前山路', '13800138018', 'gree@example.com', 'L890124', 4.9),
('方太厨卫旗舰店', '创立于2010年，业内领先品牌', '浙江省宁波市奉化区溪口镇', '13800138019', 'fotile@example.com', 'L901235', 4.8),
('小熊电器官方店', '新店开业，优惠多多，欢迎惠顾', '广东省佛山市南海区狮山镇', '13800138020', 'bear@example.com', 'L012346', 4.6);

-- 创建客户数据
INSERT INTO customers (username, password, name, email, phone) VALUES
('user1', 'password1', '张三', 'zhangsan@example.com', '13900139001'),
('user2', 'password2', '李四', 'lisi@example.com', '13900139002'),
('user3', 'password3', '王五', 'wangwu@example.com', '13900139003'),
('user4', 'password4', '赵六', 'zhaoliu@example.com', '13900139004'),
('user5', 'password5', '钱七', 'qianqi@example.com', '13900139005'),
('user6', 'password6', '孙八', 'sunba@example.com', '13900139006'),
('user7', 'password7', '周九', 'zhoujiu@example.com', '13900139007'),
('user8', 'password8', '吴十', 'wushi@example.com', '13900139008'),
('user9', 'password9', '郑十一', 'zhengshiyi@example.com', '13900139009'),
('user10', 'password10', '王十二', 'wangshier@example.com', '13900139010'),
('user11', 'password11', '刘明', 'liuming@example.com', '13900139011'),
('user12', 'password12', '陈亮', 'chenliang@example.com', '13900139012'),
('user13', 'password13', '林芳', 'linfang@example.com', '13900139013'),
('user14', 'password14', '黄强', 'huangqiang@example.com', '13900139014'),
('user15', 'password15', '周红', 'zhouhong@example.com', '13900139015'),
('user16', 'password16', '吴光', 'wuguang@example.com', '13900139016'),
('user17', 'password17', '郑晓', 'zhengxiao@example.com', '13900139017'),
('user18', 'password18', '王小', 'wangxiao@example.com', '13900139018'),
('user19', 'password19', '李大', 'lida@example.com', '13900139019'),
('user20', 'password20', '张中', 'zhangzhong@example.com', '13900139020'),
('user21', 'password21', '张三1', 'zhangsan1@example.com', '13900139021'),
('user22', 'password22', '李四1', 'lisi1@example.com', '13900139022'),
('user23', 'password23', '王五1', 'wangwu1@example.com', '13900139023'),
('user24', 'password24', '赵六1', 'zhaoliu1@example.com', '13900139024'),
('user25', 'password25', '钱七1', 'qianqi1@example.com', '13900139025'),
('user26', 'password26', '孙八1', 'sunba1@example.com', '13900139026'),
('user27', 'password27', '周九1', 'zhoujiu1@example.com', '13900139027'),
('user28', 'password28', '吴十1', 'wushi1@example.com', '13900139028'),
('user29', 'password29', '郑十一1', 'zhengshiyi1@example.com', '13900139029'),
('user30', 'password30', '王十二1', 'wangshier1@example.com', '13900139030'),
('user31', 'password31', '刘明1', 'liuming1@example.com', '13900139031'),
('user32', 'password32', '陈亮1', 'chenliang1@example.com', '13900139032'),
('user33', 'password33', '林芳1', 'linfang1@example.com', '13900139033'),
('user34', 'password34', '黄强1', 'huangqiang1@example.com', '13900139034'),
('user35', 'password35', '周红1', 'zhouhong1@example.com', '13900139035'),
('user36', 'password36', '吴光1', 'wuguang1@example.com', '13900139036'),
('user37', 'password37', '郑晓1', 'zhengxiao1@example.com', '13900139037'),
('user38', 'password38', '王小1', 'wangxiao1@example.com', '13900139038'),
('user39', 'password39', '李大1', 'lida1@example.com', '13900139039'),
('user40', 'password40', '张中1', 'zhangzhong1@example.com', '13900139040'),
('user41', 'password41', '张三2', 'zhangsan2@example.com', '13900139041'),
('user42', 'password42', '李四2', 'lisi2@example.com', '13900139042'),
('user43', 'password43', '王五2', 'wangwu2@example.com', '13900139043'),
('user44', 'password44', '赵六2', 'zhaoliu2@example.com', '13900139044'),
('user45', 'password45', '钱七2', 'qianqi2@example.com', '13900139045'),
('user46', 'password46', '孙八2', 'sunba2@example.com', '13900139046'),
('user47', 'password47', '周九2', 'zhoujiu2@example.com', '13900139047'),
('user48', 'password48', '吴十2', 'wushi2@example.com', '13900139048'),
('user49', 'password49', '郑十一2', 'zhengshiyi2@example.com', '13900139049'),
('user50', 'password50', '王十二2', 'wangshier2@example.com', '13900139050');

-- 添加管理员账户
INSERT INTO customers (username, password, name, email, phone) VALUES
('admin', 'admin', '管理员', 'admin@example.com', '13900138888');

-- 创建地址数据
INSERT INTO addresses (customer_id, receiver, phone, province, city, district, detail, is_default)
SELECT
  id,
  name,
  phone,
  CASE id % 10
    WHEN 0 THEN '北京市'
    WHEN 1 THEN '上海市'
    WHEN 2 THEN '广东省'
    WHEN 3 THEN '江苏省'
    WHEN 4 THEN '浙江省'
    WHEN 5 THEN '四川省'
    WHEN 6 THEN '湖北省'
    WHEN 7 THEN '湖南省'
    WHEN 8 THEN '河南省'
    WHEN 9 THEN '河北省'
  END,
  CASE id % 10
    WHEN 0 THEN '北京市'
    WHEN 1 THEN '上海市'
    WHEN 2 THEN '广州市'
    WHEN 3 THEN '南京市'
    WHEN 4 THEN '杭州市'
    WHEN 5 THEN '成都市'
    WHEN 6 THEN '武汉市'
    WHEN 7 THEN '长沙市'
    WHEN 8 THEN '郑州市'
    WHEN 9 THEN '石家庄市'
  END,
  CASE id % 10
    WHEN 0 THEN '朝阳区'
    WHEN 1 THEN '浦东新区'
    WHEN 2 THEN '天河区'
    WHEN 3 THEN '鼓楼区'
    WHEN 4 THEN '西湖区'
    WHEN 5 THEN '武侯区'
    WHEN 6 THEN '江岸区'
    WHEN 7 THEN '岳麓区'
    WHEN 8 THEN '金水区'
    WHEN 9 THEN '新华区'
  END,
  CONCAT('XX路XX号', id, '栋', id*2, '室'),
  true
FROM customers;

-- 创建一些额外的地址
INSERT INTO addresses (customer_id, receiver, phone, province, city, district, detail, is_default)
SELECT
  id,
  name,
  phone,
  CASE (id + 5) % 10
    WHEN 0 THEN '北京市'
    WHEN 1 THEN '上海市'
    WHEN 2 THEN '广东省'
    WHEN 3 THEN '江苏省'
    WHEN 4 THEN '浙江省'
    WHEN 5 THEN '四川省'
    WHEN 6 THEN '湖北省'
    WHEN 7 THEN '湖南省'
    WHEN 8 THEN '河南省'
    WHEN 9 THEN '河北省'
  END,
  CASE (id + 5) % 10
    WHEN 0 THEN '北京市'
    WHEN 1 THEN '上海市'
    WHEN 2 THEN '广州市'
    WHEN 3 THEN '南京市'
    WHEN 4 THEN '杭州市'
    WHEN 5 THEN '成都市'
    WHEN 6 THEN '武汉市'
    WHEN 7 THEN '长沙市'
    WHEN 8 THEN '郑州市'
    WHEN 9 THEN '石家庄市'
  END,
  CASE (id + 5) % 10
    WHEN 0 THEN '海淀区'
    WHEN 1 THEN '徐汇区'
    WHEN 2 THEN '番禺区'
    WHEN 3 THEN '建邺区'
    WHEN 4 THEN '余杭区'
    WHEN 5 THEN '青羊区'
    WHEN 6 THEN '武昌区'
    WHEN 7 THEN '开福区'
    WHEN 8 THEN '中原区'
    WHEN 9 THEN '桥西区'
  END,
  CONCAT('YY路YY号', id*3, '栋', id*5, '室'),
  false
FROM customers
WHERE id <= 20;

-- 创建购物车表
CREATE TABLE IF NOT EXISTS cart_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    UNIQUE KEY unique_customer_product (customer_id, product_id)
);

-- 添加索引优化查询性能
CREATE INDEX idx_cart_customer ON cart_items(customer_id);
CREATE INDEX idx_cart_product ON cart_items(product_id);

-- 插入产品数据
-- 更多产品数据将在后续插入 