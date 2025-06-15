@echo off
echo ================================================
echo           淘宝项目完整启动脚本
echo ================================================
echo.

echo 步骤1: 检查数据库是否已初始化...
mysql -u root -p -e "USE taobao_db; SELECT COUNT(*) FROM products;" 2>nul >nul
if %errorlevel% neq 0 (
    echo 数据库未初始化，正在初始化...
    call init_database.bat
)

echo.
echo 步骤2: 编译后端项目...
echo 正在编译...
mvn clean compile -q
if %errorlevel% neq 0 (
    echo ❌ 后端编译失败！
    pause
    exit /b 1
)
echo ✅ 后端编译成功

echo.
echo 步骤3: 启动后端服务（后台运行）...
start "Taobao Backend" cmd /k "echo 启动后端服务... && mvn spring-boot:run"
echo 后端服务启动中，请等待15秒...
timeout /t 15

echo.
echo 步骤4: 检查并安装前端依赖...
cd frontend
if not exist node_modules (
    echo 正在安装前端依赖...
    npm install
)

echo.
echo 步骤5: 启动前端服务（后台运行）...
start "Taobao Frontend" cmd /k "echo 启动前端服务... && npm run serve"
echo 前端服务启动中，请等待20秒...
timeout /t 20
cd ..

echo.
echo 步骤6: 检查服务状态...
echo 等待服务完全启动...
timeout /t 5

echo.
echo 检查后端服务...
curl -s http://localhost:8080/api/products >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 后端服务运行正常 - http://localhost:8080
) else (
    echo ❌ 后端服务可能还在启动中，请稍后再试
)

echo.
echo 检查前端服务...
curl -s http://localhost:8081 >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 前端服务运行正常 - http://localhost:8081
) else (
    echo ❌ 前端服务可能还在启动中，请稍后再试
)

echo.
echo ================================================
echo 🎉 项目启动完成！
echo.
echo 📱 前端应用：http://localhost:8081
echo 🔗 后端API：http://localhost:8080/api
echo 🧪 测试页面：http://localhost:8081/cart-sync-test
echo.
echo 测试账户：
echo - testuser / password123
echo - zhangsan / pass123
echo.
echo 注意：如果服务还在启动中，请等待1-2分钟后再访问
echo ================================================
pause 