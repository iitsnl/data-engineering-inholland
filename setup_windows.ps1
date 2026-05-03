Write-Host "============================="
Write-Host "Data & AI Platform Setup"
Write-Host "============================="

# Ensure we are running in the course root directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ScriptDir

# 1. Check if Python is installed
Write-Host "1. Checking for Python installation..."
if (-not (Get-Command "python" -ErrorAction SilentlyContinue)) {
    Write-Host "Python is not installed. Attempting to install via Windows Package Manager (winget)..." -ForegroundColor Yellow
    
    # Try to install Python via winget (Built into Windows 10/11)
    try {
        winget install --id Python.Python.3.11 --exact --source winget --accept-package-agreements --accept-source-agreements
        Write-Host ""
        Write-Host "IMPORTANT: Python has been installed!" -ForegroundColor Green
        Write-Host "Please close this PowerShell window, open a NEW one, and re-run this script to continue." -ForegroundColor Yellow
        exit
    } catch {
        Write-Host "Failed to install Python automatically. Please download it manually from python.org" -ForegroundColor Red
        exit
    }
} else {
    $pyVersion = python --version
    Write-Host "Found Python: $pyVersion" -ForegroundColor Green
}

# 2. Create Virtual Environment
Write-Host "`n2. Creating Virtual Environment (venv)..."
if (-not (Test-Path "venv")) {
    python -m venv venv
    Write-Host "Virtual environment created." -ForegroundColor Green
} else {
    Write-Host "Virtual environment already exists." -ForegroundColor Cyan
}

# 3. Install Dependencies
Write-Host "`n3. Installing Requirements..."
# We use the python.exe directly from the venv to bypass execution policy restrictions on Activate.ps1
.\venv\Scripts\python.exe -m pip install --upgrade pip | Out-Null
.\venv\Scripts\python.exe -m pip install -r requirements.txt

Write-Host "`n============================="
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "============================="
Write-Host "To start the Jupyter environment, double-click launch_jupyter.cmd" -ForegroundColor Cyan
Write-Host ""