#!/bin/bash

# Navigate to the course root directory
cd "$(dirname "$0")"

echo "============================="
echo "Data & AI Platform Setup"
echo "============================="

# 1. Check if Python is installed
echo -e "\n1. Checking for Python 3 installation..."
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Attempting automatic installation..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OS
        if ! command -v brew &> /dev/null; then
            echo "Homebrew is missing. Please install Python manually from python.org"
            exit 1
        fi
        echo "Installing Python via Homebrew..."
        brew install python@3.11
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux (Debian/Ubuntu assumed)
        echo "Installing Python via apt..."
        sudo apt-get update
        sudo apt-get install -y python3.11 python3.11-venv python3-pip
    else
        echo "Unsupported OS for automatic install. Please install Python 3 manually."
        exit 1
    fi
else
    echo "Python 3 found: $(python3 --version)"
fi

# Determine the correct python command (in case it's installed as python3.11)
PYTHON_CMD="python3"

# 2. Create Virtual Environment
echo -e "\n2. Creating Virtual Environment (venv)..."
if [ ! -d "venv" ]; then
    $PYTHON_CMD -m venv venv
    echo "Virtual environment created."
else
    echo "Virtual environment already exists."
fi

# 3. Install Dependencies
echo -e "\n3. Activating and Installing Requirements..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo -e "\n============================="
echo -e "\033[0;32mSetup Complete!\033[0m"
echo -e "============================="
echo "To start the Jupyter environment, simply run:"
echo -e "\033[0;36msource venv/bin/activate && jupyter lab\033[0m"
echo ""