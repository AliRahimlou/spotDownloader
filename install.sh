#!/bin/bash

echo "🚀 SpotDL Docker Installer 🚀"
echo "Checking if Docker is installed..."

# Use full path for Docker
DOCKER_PATH="/usr/local/bin/docker"

# Check if Docker exists
if [ ! -x "$DOCKER_PATH" ]; then
    echo "❌ Docker is not installed. Please install Docker first:"
    echo "👉 https://docs.docker.com/get-docker/"
    exit 1
fi

echo "✅ Docker is installed!"

# Build and run the container
"$DOCKER_PATH" compose up --build
