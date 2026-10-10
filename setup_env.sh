#!/bin/bash

# Setup script for Handwritten Text Recognition project
# Creates virtual environment 'venv' and installs core dependencies

set -e  # Exit on error

PROJECT_DIR="/Users/aj/Desktop/handwriting_project"
VENV_DIR="$PROJECT_DIR/venv"

echo "=== Setting up Handwritten Text Recognition environment ==="
echo "Project directory: $PROJECT_DIR"
echo "Virtual environment: $VENV_DIR"

# Check if Python 3 is available
if ! command -v python3 &> /dev/null; then
    echo "Error: python3 not found. Please install Python 3 first."
    exit 1
fi

echo "Python version: $(python3 --version)"

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
else
    echo "Virtual environment already exists at $VENV_DIR"
fi

# Activate virtual environment
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install core dependencies
echo "Installing core dependencies..."
pip install jupyter opencv-python numpy matplotlib torch torchvision

echo ""
echo "=== Setup complete! ==="
echo ""
echo "To activate the environment in future sessions, run:"
echo "  source $VENV_DIR/bin/activate"
echo ""
echo "To start Jupyter Notebook:"
echo "  jupyter notebook"
echo ""
echo "To deactivate:"
echo "  deactivate"