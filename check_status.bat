@echo off
echo ================================================
echo            淘宝项目运行状态检查
echo ================================================
echo.

echo 检查后端服务 (Spring Boot)...
curl -s http://localhost:8080/api/products >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 后端服务运行正常 - http://localhost:8080
) else (
    echo ❌ 后端服务未启动或异常
)

echo.
echo 检查前端服务 (Vue.js)...
curl -s http://localhost:8081 >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 前端服务运行正常 - http://localhost:8081
) else (
    echo ❌ 前端服务未启动或异常
)

echo.
echo 检查数据库连接...
mysql -u root -p -e "USE taobao_db; SELECT COUNT(*) FROM products;" 2>nul | find /c ">"
if %errorlevel% equ 0 (
    echo ✅ 数据库连接正常
) else (
    echo ❌ 数据库连接失败
)

echo.
echo ================================================
echo 测试账户信息：
echo - 管理员：admin / admin123
echo - 用户：testuser / password123
echo - 张三：zhangsan / pass123
echo.
echo 购物车测试页面：http://localhost:8081/cart-sync-test
echo API文档：http://localhost:8080/api
echo ================================================
echo.
pause 