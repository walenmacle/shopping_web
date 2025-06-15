@echo off
echo 正在初始化数据库...
echo.

echo 步骤1: 创建数据库结构和表...
mysql -u root -p < init_db_optimized.sql
if %errorlevel% neq 0 (
    echo 数据库结构初始化失败！
    pause
    exit /b 1
)

echo 步骤2: 插入测试数据...
mysql -u root -p < init_data_optimized.sql
if %errorlevel% neq 0 (
    echo 测试数据插入失败！
    pause
    exit /b 1
)

echo.
echo ✅ 数据库初始化完成！
echo.
echo 您可以使用以下测试账户：
echo - 管理员：admin / admin123
echo - 用户：testuser / password123
echo - 其他：zhangsan / pass123
echo.
pause 