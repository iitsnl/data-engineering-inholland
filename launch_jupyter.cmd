@echo off
echo Starting Jupyter Lab...
cd /d "%~dp0"
call venv\Scripts\activate.bat
jupyter lab
pause