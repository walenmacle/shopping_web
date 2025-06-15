#!/bin/bash

# 淘宝电商平台API测试脚本

echo "=== 淘宝电商平台API测试 ==="
echo ""

BASE_URL="http://localhost:8080/api"

# 测试服务器是否启动
echo "1. 测试后端服务是否启动..."
if curl -s "$BASE_URL/products" > /dev/null; then
    echo "✅ 后端服务正常运行"
else
    echo "❌ 后端服务未启动或无法访问"
    echo "请确保后端服务在 http://localhost:8080 运行"
    exit 1
fi

echo ""

# 测试数据初始化
echo "2. 初始化测试数据..."
INIT_RESPONSE=$(curl -s -X POST "$BASE_URL/admin/init-data")
echo "初始化响应: $INIT_RESPONSE"

echo ""

# 测试获取商品列表
echo "3. 测试获取商品列表..."
PRODUCTS_RESPONSE=$(curl -s "$BASE_URL/products")
PRODUCTS_COUNT=$(echo "$PRODUCTS_RESPONSE" | grep -o '"id"' | wc -l)
echo "商品数量: $PRODUCTS_COUNT"

echo ""

# 测试获取商家列表
echo "4. 测试获取商家列表..."
SELLERS_RESPONSE=$(curl -s "$BASE_URL/sellers")
SELLERS_COUNT=$(echo "$SELLERS_RESPONSE" | grep -o '"id"' | wc -l)
echo "商家数量: $SELLERS_COUNT"

echo ""

# 测试用户注册
echo "5. 测试用户注册..."
REGISTER_DATA='{
    "username": "testuser",
    "password": "testpass",
    "name": "测试用户",
    "email": "test@example.com",
    "phone": "13800138000"
}'

REGISTER_RESPONSE=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    -d "$REGISTER_DATA" \
    "$BASE_URL/auth/register")

echo "注册响应: $REGISTER_RESPONSE"

echo ""

# 测试用户登录
echo "6. 测试用户登录..."
LOGIN_DATA='{
    "username": "testuser",
    "password": "testpass"
}'

LOGIN_RESPONSE=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    -d "$LOGIN_DATA" \
    "$BASE_URL/auth/login")

echo "登录响应: $LOGIN_RESPONSE"

# 提取token
TOKEN=$(echo "$LOGIN_RESPONSE" | grep -o '"token":"[^"]*"' | cut -d'"' -f4)

if [ -n "$TOKEN" ]; then
    echo "✅ 登录成功，获取到token: ${TOKEN:0:20}..."
    
    echo ""
    
    # 测试需要认证的API
    echo "7. 测试需要认证的API..."
    USER_ID=$(echo "$LOGIN_RESPONSE" | grep -o '"id":[0-9]*' | cut -d':' -f2)
    
    if [ -n "$USER_ID" ]; then
        ORDERS_RESPONSE=$(curl -s -H "Authorization: Bearer $TOKEN" \
            "$BASE_URL/orders/customer/$USER_ID")
        echo "用户订单响应: $ORDERS_RESPONSE"
    fi
else
    echo "❌ 登录失败，无法获取token"
fi

echo ""
echo "=== API测试完成 ==="
echo ""
echo "如果所有测试都通过，说明前后端连接正常！"
echo "现在可以启动前端服务进行完整测试："
echo "cd frontend && npm run serve" 