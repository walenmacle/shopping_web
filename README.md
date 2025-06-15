# 电商平台管理系统

这是一个基于Vue+SpringBoot+Java JDK 1.8的电商平台管理系统。

## 项目功能

### 客户端功能
- 浏览商品和商品评价
- 查看商品详情和销量趋势
- 将商品加入购物车
- 下单并选择收货信息
- 查看订单状态和物流信息
- 查看商家信息和评分

### 商家端功能
- 管理商品信息和库存
- 查看销售统计和趋势
- 处理订单和更新物流状态

## 技术栈

### 前端
- Vue 2.6
- Vuex
- Vue Router
- Element UI
- Axios
- Chart.js

### 后端
- SpringBoot 2.5
- Spring Data JPA
- MySQL

## 项目结构

```
taobao/
├── frontend/                # 前端Vue项目
│   ├── public/              # 静态资源
│   └── src/                 # 源代码
│       ├── assets/          # 资源文件
│       ├── components/      # 组件
│       ├── views/           # 视图
│       ├── router/          # 路由
│       ├── store/           # Vuex状态管理
│       ├── App.vue          # 根组件
│       └── main.js          # 入口文件
├── src/                     # 后端Java项目
│   └── main/
│       ├── java/com/taobao/ # Java源代码
│       │   ├── controller/  # 控制器
│       │   ├── entity/      # 实体类
│       │   ├── repository/  # 数据访问层
│       │   ├── service/     # 服务层
│       │   └── TaobaoApplication.java # 应用入口
│       └── resources/       # 资源文件
│           └── application.properties # 配置文件
└── pom.xml                  # Maven配置文件
```

## 数据模型

### 主要实体
- Product (商品)
- Seller (商家)
- Customer (客户)
- Order (订单)
- OrderItem (订单项)
- Address (地址)
- Review (评价)
- SalesStatistics (销售统计)

## 安装和运行

### 后端

1. 确保已安装Java JDK 1.8和Maven
2. 创建MySQL数据库`taobao`
3. 修改`application.properties`中的数据库配置
4. 运行以下命令启动后端服务：

```bash
mvn spring-boot:run
```
java -jar target/taobao-0.0.1-SNAPSHOT.jar
### 前端

1. 确保已安装Node.js和npm
2. 进入frontend目录
3. 运行以下命令安装依赖：

```bash
npm install
```

4. 启动开发服务器：

```bash
npm run serve
```

5. 访问 http://localhost:8080

## API接口

### 商品相关
- `GET /api/products` - 获取所有商品
- `GET /api/products/{id}` - 获取商品详情
- `GET /api/products/search?name={name}` - 搜索商品
- `GET /api/products/{id}/reviews` - 获取商品评价
- `GET /api/products/{id}/sales-statistics` - 获取商品销售统计

### 订单相关
- `GET /api/orders` - 获取所有订单
- `GET /api/orders/{id}` - 获取订单详情
- `GET /api/orders/customer/{customerId}` - 获取客户订单
- `POST /api/orders` - 创建订单
- `PATCH /api/orders/{id}/status` - 更新订单状态

### 商家相关
- `GET /api/sellers/{id}` - 获取商家详情
- `GET /api/products/seller/{sellerId}` - 获取商家商品
- `GET /api/sellers/{id}/sales-statistics` - 获取商家销售统计

## 项目介绍
这是一个基于Vue.js和Spring Boot的电商平台实现，包含以下功能：

- 用户登录、注册及权限管理
- 商品浏览与搜索
- 购物车管理
- 订单管理
- 后台数据管理

## 前端部分

### 技术栈
- Vue.js 2.x
- Vuex
- Vue Router
- Element UI
- Axios
- ECharts (数据可视化)

### 主要功能

#### 用户模块
- 登录/注册
- 身份验证
- 用户角色管理（普通用户/管理员）

#### 商品模块
- 商品列表展示
- 商品详情
- 搜索和筛选

#### 购物车模块
- 加入购物车
- 购物车商品管理
- 结算

#### 订单模块
- 订单创建
- 订单列表
- 订单详情

#### 管理后台
- 数据初始化
- 销售统计分析
- 用户管理
- 商品管理
- 订单管理

### 最近更新内容
1. **完成前后端数据交互连接** ✅
   - 创建了完整的认证API（登录/注册/登出）
   - 更新了所有前端页面，使其调用真实的后端API
   - 配置了axios请求和响应拦截器，自动处理认证
   - 实现了商品、订单、商家等核心功能的API调用
   - 添加了错误处理和降级机制

2. 修复了数据初始化功能
   - 添加了正确的API请求头，包含用户认证token
   - 修正了API请求路径
   - 增强了错误处理

3. 新增了销售统计分析功能
   - 添加了销售数据汇总展示
   - 实现了销售趋势图表
   - 实现了商品销量排行统计
   - 实现了销售类别占比分析
   - 支持按日期范围和商品类别筛选

4. **API接口完善**
   - 后端提供完整的REST API接口
   - 支持商品搜索、分页、筛选
   - 支持订单状态管理和更新
   - 支持用户认证和权限控制

## 后端部分

### 技术栈
- Spring Boot
- Spring Data JPA
- MySQL
- Spring Security

### API文档
API接口文档详见后端代码仓库。

## 运行说明

### 前端
```bash
# 进入前端目录
cd frontend

# 安装依赖
npm install

# 启动开发服务器
npm run serve
```

### 后端
```bash
# 使用Maven启动
mvn spring-boot:run
```

## 项目截图
(项目截图待添加)

## 贡献者
- [您的名字] 