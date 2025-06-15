# 淘宝数据库初始化说明

本文档说明如何使用SQL脚本初始化淘宝电商平台的数据库。

## 数据库结构

淘宝数据库包含以下表：

1. `sellers` - 卖家信息
2. `customers` - 客户信息
3. `addresses` - 地址信息
4. `products` - 产品信息
5. `orders` - 订单信息
6. `order_items` - 订单项信息
7. `reviews` - 评论信息

## 初始化脚本

本项目包含以下SQL脚本：

- `init_db.sql` - 初始化卖家、客户和地址数据
- `init_db_products.sql` - 初始化产品数据
- `init_db_orders.sql` - 初始化订单、订单项和评论数据
- `init_all.sql` - 一键初始化所有数据的脚本
- `check_data.sql` - 检查数据是否正确导入的脚本

## 使用方法

### 一键初始化

要一键初始化整个数据库，请执行以下命令：

```bash
mysql -u root -p taobao -e "source init_all.sql"
```

这将会：
1. 关闭外键检查
2. 清空所有表
3. 导入卖家、客户和地址数据
4. 导入产品数据
5. 导入订单、订单项和评论数据
6. 重新开启外键检查
7. 显示导入结果统计

### 单独执行脚本

如果需要单独执行某个脚本，可以使用以下命令：

```bash
mysql -u root -p taobao -e "source 脚本名称.sql"
```

例如：

```bash
mysql -u root -p taobao -e "source init_db.sql"
```

### 检查数据

要检查数据是否正确导入，可以执行以下命令：

```bash
mysql -u root -p taobao -e "source check_data.sql"
```

## 数据统计

初始化后的数据统计：

| 表名         | 记录数 |
|--------------|--------|
| Sellers      | 20     |
| Customers    | 51     |
| Addresses    | 71     |
| Products     | 70     |
| Orders       | 20     |
| Order Items  | 21     |
| Reviews      | 15     |

## 数据示例

### 卖家数据

前5条卖家数据：

| id | name               | contact_phone | contact_email      |
|----|--------------------|--------------|--------------------|
| 1  | 京东自营           | 13800138001  | jd@example.com     |
| 2  | 天猫官方旗舰店     | 13800138002  | tmall@example.com  |
| 3  | 苏宁易购           | 13800138003  | suning@example.com |
| 4  | 拼多多             | 13800138004  | pdd@example.com    |
| 5  | 唯品会             | 13800138005  | vip@example.com    |

### 产品数据

前5条产品数据：

| id | name                  | price   | stock | seller_id |
|----|--------------------   |---------|-------|-----------|
| 1  | iPhone 13 Pro 黑色    | 8999.00 | 100   | 8         |
| 2  | MacBook Air 银色      | 7999.00 | 50    | 8         |
| 3  | iPad Pro 深空灰       | 5999.00 | 80    | 8         |
| 4  | AirPods Pro           | 1999.00 | 200   | 8         |
| 5  | Apple Watch Series 7  | 2999.00 | 100   | 8         |

## 注意事项

1. 初始化脚本会清空所有表，请确保在执行前备份重要数据。
2. 执行脚本前请确保已创建`taobao`数据库。
3. 执行脚本需要MySQL的root权限或者具有足够权限的用户。 