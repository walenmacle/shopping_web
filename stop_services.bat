@echo off
echo ================================================
echo           停止淘宝项目所有服务
echo ================================================
echo.

echo 正在停止Spring Boot进程...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8080" ^| find "LISTENING"') do (
    echo 终止进程 %%a
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo 正在停止前端开发服务器进程...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8081" ^| find "LISTENING"') do (
    echo 终止进程 %%a  
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo 正在停止Node.js进程...
taskkill /f /im node.exe >nul 2>&1

echo.
echo 正在停止Java进程...
for /f "tokens=2" %%a in ('tasklist /fi "imagename eq java.exe" /fo table /nh 2^>nul') do (
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo ✅ 所有服务已停止
echo.
pause 