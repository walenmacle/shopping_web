# 淘宝电商平台项目启动指南

## 项目概述

这是一个基于Vue.js + Spring Boot的电商平台项目，包含完整的前端和后端功能。

## 技术栈

### 后端
- Spring Boot 2.5.6
- Spring Data JPA
- MySQL 8.0
- Java 1.8

### 前端
- Vue.js 2.6
- Element UI
- Axios
- Vuex
- Vue Router

## 启动步骤

### 1. 环境准备

确保您的系统已安装：
- Java JDK 1.8+
- Maven 3.6+
- Node.js 14+
- MySQL 8.0+

### 2. 数据库配置

1. 创建MySQL数据库：
```sql
CREATE DATABASE taobao CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

2. 修改后端配置文件 `src/main/resources/application.properties`：
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/taobao?useSSL=false&serverTimezone=UTC&characterEncoding=utf-8&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=你的数据库密码
```

### 3. 启动后端服务

在项目根目录执行：
```bash
mvn clean install
mvn spring-boot:run
```

后端服务将在 http://localhost:8080 启动

### 4. 启动前端服务

在 `frontend` 目录下执行：
```bash
cd frontend
npm install
npm run serve
```

前端服务将在 http://localhost:8081 启动

### 5. 初始化测试数据

访问前端页面后，可以通过以下方式初始化测试数据：

1. 使用管理员账号登录（用户名：admin，密码：admin）
2. 进入管理后台
3. 点击"数据初始化"按钮

或者直接调用API：
```bash
curl -X POST http://localhost:8080/api/admin/init-data
```

## 功能特性

### 用户功能
- ✅ 用户注册/登录
- ✅ 商品浏览和搜索
- ✅ 购物车管理
- ✅ 订单管理
- ✅ 个人信息管理

### 管理功能
- ✅ 商品管理
- ✅ 订单管理
- ✅ 用户管理
- ✅ 销售统计
- ✅ 数据初始化

### API接口

#### 认证相关
- POST `/api/auth/login` - 用户登录
- POST `/api/auth/register` - 用户注册
- POST `/api/auth/logout` - 用户登出

#### 商品相关
- GET `/api/products` - 获取商品列表
- GET `/api/products/{id}` - 获取商品详情
- GET `/api/products/search?name={name}` - 搜索商品

#### 订单相关
- GET `/api/orders/customer/{customerId}` - 获取用户订单
- POST `/api/orders` - 创建订单
- PATCH `/api/orders/{id}/status` - 更新订单状态

#### 商家相关
- GET `/api/sellers` - 获取商家列表
- GET `/api/sellers/{id}` - 获取商家详情

## 测试账号

### 管理员账号
- 用户名：admin
- 密码：admin

### 普通用户账号
初始化数据后会自动创建50个测试用户：
- 用户名：user1 到 user50
- 密码：password1 到 password50

## 项目结构

```
taobao/
├── src/                     # 后端源码
│   └── main/
│       ├── java/com/taobao/
│       │   ├── controller/  # 控制器层
│       │   ├── service/     # 服务层
│       │   ├── repository/  # 数据访问层
│       │   ├── entity/      # 实体类
│       │   └── util/        # 工具类
│       └── resources/       # 配置文件
├── frontend/                # 前端源码
│   ├── src/
│   │   ├── views/          # 页面组件
│   │   ├── components/     # 公共组件
│   │   ├── router/         # 路由配置
│   │   ├── store/          # 状态管理
│   │   └── assets/         # 静态资源
│   └── public/             # 公共资源
└── pom.xml                 # Maven配置
```

## 常见问题

### 1. 后端启动失败
- 检查Java版本是否为1.8+
- 检查MySQL服务是否启动
- 检查数据库连接配置是否正确

### 2. 前端启动失败
- 检查Node.js版本是否为14+
- 删除node_modules文件夹，重新执行npm install
- 检查端口8081是否被占用

### 3. 数据库连接失败
- 确认MySQL服务正在运行
- 检查数据库用户名和密码
- 确认数据库taobao已创建

### 4. 前端无法访问后端API
- 确认后端服务在8080端口正常运行
- 检查前端axios配置的baseURL
- 检查浏览器控制台是否有CORS错误

## 开发说明

### 前后端分离架构
- 前端使用Vue.js开发，运行在8081端口
- 后端使用Spring Boot开发，运行在8080端口
- 前端通过axios调用后端REST API

### 数据库设计
- 使用JPA自动创建表结构
- 支持数据库表的自动更新
- 包含完整的电商业务实体关系

### 认证机制
- 使用简单的Token认证
- Token存储在localStorage中
- 请求拦截器自动添加认证头

## 联系方式

如有问题，请联系开发团队。 