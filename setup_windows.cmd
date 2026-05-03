@echo off
echo =========================================
echo Launching Data & AI Platform Setup...
echo =========================================
echo.
REM This safely bypasses the default Windows PowerShell execution policy for this script only.
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0setup_windows.ps1"
echo.
pause