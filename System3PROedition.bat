@echo off
title System Utility Script
color 0A
:menu
cls
echo ========================================
echo      System Utility Script (15 Options)
echo ========================================
echo 1. Check Internet Connection
echo 2. Show Network Configuration
echo 3. Flush DNS Cache
echo 4. Display System Information
echo 5. Check Disk Space
echo 6. List Running Processes
echo 7. Kill a Process by Name
echo 8. Restart System
echo 9. Shutdown System
echo 10. Clear Temporary Files
echo 11. Show Installed Programs
echo 12. Check System Uptime
echo 13. Check CPU Usage
echo 14. Check RAM Usage
echo 15. Exit
echo ========================================
set /p choice=Enter your choice (1-15): 

if "%choice%"=="1" ping google.com
if "%choice%"=="2" ipconfig /all
if "%choice%"=="3" ipconfig /flushdns
if "%choice%"=="4" systeminfo
if "%choice%"=="5" wmic logicaldisk get size,freespace,caption
if "%choice%"=="6" tasklist
if "%choice%"=="7" (
    set /p pname=Enter process name to terminate: 
    taskkill /F /IM %pname%
)
if "%choice%"=="8" shutdown /r /t 0
if "%choice%"=="9" shutdown /s /t 0
if "%choice%"=="10" del /s /q "C:\Windows\Temp\*"
if "%choice%"=="11" wmic product get name
if "%choice%"=="12" systeminfo | find "System Boot Time"
if "%choice%"=="13" wmic cpu get loadpercentage
if "%choice%"=="14" wmic os get freephysicalmemory,totalvisiblememorysize
if "%choice%"=="15" exit

pause
goto menu
