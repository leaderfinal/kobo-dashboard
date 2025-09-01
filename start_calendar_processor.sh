#!/bin/bash
# Development startup script for Calendar Processor

echo "Starting Calendar Processor Service..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed"
    exit 1
fi

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "Error: pip3 is not installed"
    exit 1
fi

# Install requirements if needed
if [ ! -f "venv/bin/activate" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

source venv/bin/activate

echo "Installing Python dependencies..."
pip install -r requirements.txt

echo "Starting calendar processor..."
python calendar_processor.py
