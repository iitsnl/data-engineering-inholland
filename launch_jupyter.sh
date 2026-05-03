#!/bin/bash
echo "Starting Jupyter Lab..."
cd "$(dirname "$0")"
source venv/bin/activate
jupyter lab