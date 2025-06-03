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
echo 12. Check System Uptime (Alternative)
echo 13. Check CPU Usage (New Alternative)
echo 14. Check RAM Usage (Alternative)
echo 15. Exit
echo ========================================
set /p choice=Enter your choice (1-15): 

if "%choice%"=="1" ping google.com
if "%choice%"=="2" ipconfig /all
if "%choice%"=="3" ipconfig /flushdns
if "%choice%"=="4" systeminfo
if "%choice%"=="5" dir /s /b "C:\"
if "%choice%"=="6" tasklist
if "%choice%"=="7" (
    set /p pname=Enter process name to terminate: 
    taskkill /F /IM %pname%
)
if "%choice%"=="8" shutdown /r /t 0
if "%choice%"=="9" shutdown /s /t 0
if "%choice%"=="10" del /s /q "C:\Windows\Temp\*"
if "%choice%"=="11" reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall"
if "%choice%"=="12" net statistics workstation | find "Statistics since"
if "%choice%"=="13" wmic cpu get loadpercentage  ^>nul 2^>nul & typeperf "\Processor(_Total)\% Processor Time" -sc 1
if "%choice%"=="14" systeminfo | find "Available Physical Memory"
if "%choice%"=="15" exit

pause
goto menu
