@echo off
chcp 65001 >nul

echo === 淘宝电商平台API测试 ===
echo.

set BASE_URL=http://localhost:8080/api

echo 1. 测试后端服务是否启动...
curl -s "%BASE_URL%/products" >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 后端服务正常运行
) else (
    echo ❌ 后端服务未启动或无法访问
    echo 请确保后端服务在 http://localhost:8080 运行
    pause
    exit /b 1
)

echo.

echo 2. 初始化测试数据...
curl -s -X POST "%BASE_URL%/admin/init-data"
echo.

echo 3. 测试获取商品列表...
curl -s "%BASE_URL%/products" | find /c """id""" >temp_count.txt
set /p PRODUCTS_COUNT=<temp_count.txt
del temp_count.txt
echo 商品数量: %PRODUCTS_COUNT%

echo.

echo 4. 测试获取商家列表...
curl -s "%BASE_URL%/sellers" | find /c """id""" >temp_count.txt
set /p SELLERS_COUNT=<temp_count.txt
del temp_count.txt
echo 商家数量: %SELLERS_COUNT%

echo.

echo 5. 测试用户注册...
set REGISTER_DATA={"username":"testuser","password":"testpass","name":"测试用户","email":"test@example.com","phone":"13800138000"}

curl -s -X POST -H "Content-Type: application/json" -d "%REGISTER_DATA%" "%BASE_URL%/auth/register"
echo.

echo 6. 测试用户登录...
set LOGIN_DATA={"username":"testuser","password":"testpass"}

curl -s -X POST -H "Content-Type: application/json" -d "%LOGIN_DATA%" "%BASE_URL%/auth/login" >login_response.txt
type login_response.txt
echo.

echo.
echo === API测试完成 ===
echo.
echo 如果所有测试都通过，说明前后端连接正常！
echo 现在可以启动前端服务进行完整测试：
echo cd frontend ^&^& npm run serve

if exist login_response.txt del login_response.txt
pause 