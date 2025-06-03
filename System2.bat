@echo off
title Multi-Function PC Tool

:: Open System2.bat as Admin in a separate tab
echo Launching System2.bat as Admin...
powershell -command "Start-Process system2.bat -Verb RunAs"

:menu
cls
echo Select an option:
echo 1. System Scan (Runs in System2.bat)
echo 2. PC Usage (Opens real-time monitoring)
echo 3. Internet Info
echo 4. Supply
echo 5. Exit
set /p choice=Enter your choice: 

if "%choice%"=="1" goto system_scan
if "%choice%"=="2" goto pc_usage
if "%choice%"=="3" goto internet_info
if "%choice%"=="4" goto supply
if "%choice%"=="5" exit

:: Fixed PC Usage Monitoring (No WMIC, real-time tracking)
:pc_usage
cls
echo Gathering real-time system usage...
echo (Press CTRL+C to stop monitoring)
:loop
cls
echo CPU Usage:
powershell -Command "Get-CimInstance Win32_Processor | Select-Object LoadPercentage"

echo RAM Usage:
powershell -Command "$ram_total = (Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize/1024; $ram_free = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory/1024; $ram_used = $ram_total - $ram_free; $ram_percent = [math]::Round(($ram_used/$ram_total)*100,2); Write-Output ('RAM Usage: ' + $ram_percent + '%')"

echo Processing Speed:
powershell -Command "Get-CimInstance Win32_Processor | Select-Object -ExpandProperty MaxClockSpeed"

timeout /nobreak /t 5 >nul
goto loop

:: System Scan (Runs inside System2.bat, keeping main menu active)
:system_scan
echo System scan is running in System2.bat...
pause
goto menu

:: Internet Info Section
:internet_info
cls
echo Internet Monitoring Options:
echo 1. List Connected Devices
echo 2. Show Active Internet Traffic
echo 3. View Computer Activity Logs
echo 4. Back to Main Menu
set /p net_choice=Enter your choice: 

if "%net_choice%"=="1" goto connected_devices
if "%net_choice%"=="2" goto active_connections
if "%net_choice%"=="3" goto computer_logs
if "%net_choice%"=="4" goto menu

:: Connected Devices Scan
:connected_devices
echo Listing all devices connected to the network...
arp -a
pause
goto internet_info

:: Active Connections Monitoring
:active_connections
echo Showing all active internet connections...
netstat -an
pause
goto internet_info

:: Computer Activity Logs
:computer_logs
cls
echo Gathering system activity logs...
powershell -command "Get-EventLog -LogName Security -Newest 10"
powershell -command "Get-CimInstance Win32_Product | Select Name"
powershell -command "Get-ChildItem -Path C:\Users -Recurse -Force -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 10"
pause
goto internet_info

:: Supply Section
:supply
cls
echo Supply Options:
echo 1. Download System Scanner (Runs systemscan.bat)
echo 2. Fix PC Usage
echo 3. Fix/Refresh Internet Info
echo 4. Download Enhancer
echo 5. Back to Main Menu
set /p supply_choice=Enter your choice: 

if "%supply_choice%"=="1" goto run_systemscan
if "%supply_choice%"=="2" goto fix_pc_usage
if "%supply_choice%"=="3" goto fix_internet_info
if "%supply_choice%"=="4" goto download_enhancer
if "%supply_choice%"=="5" goto menu

:: System Scanner Download (Calls systemscan.bat)
:run_systemscan
echo Running systemscan.bat to download and install scanner...
start "" "systemscan.bat"
pause
goto supply

:: Fix PC Usage
:fix_pc_usage
echo Fixing PC Usage issues...
pause
goto supply

:: Fix Internet Info
:fix_internet_info
echo Refreshing Internet Info...
pause
goto supply

:: Download Enhancer
:download_enhancer
echo Downloading Enhancer...
pause
goto supply