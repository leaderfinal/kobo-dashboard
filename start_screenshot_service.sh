#!/bin/bash
# Development startup script for Screenshot Service

echo "Starting Screenshot Service..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Error: Node.js is not installed"
    exit 1
fi

# Install npm dependencies
echo "Installing Node.js dependencies..."
npm install

echo "Starting screenshot service..."
node screenshot_service.js
