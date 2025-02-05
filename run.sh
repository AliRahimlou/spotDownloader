#!/bin/bash

# Check if the container exists
if docker ps -a --format '{{.Names}}' | grep -q "^spotdl_container$"; then
    echo "🚀 Container exists. Starting it..."
    docker-compose up -d  # Just start the container
else
    echo "⚙️  Container does not exist. Building and starting..."
    docker-compose up --build -d  # Build and start the container
fi

# Wait a moment to ensure the container is running
echo "⏳ Waiting for container to fully start..."
sleep 3  # Increased delay to ensure the container is ready

# Check if the container is running before executing the script
if docker ps --format '{{.Names}}' | grep -q "^spotdl_container$"; then
    echo "✅ Container is running. Executing SpotDL..."
    docker exec -it spotdl_container python /app/download.py
else
    echo "❌ Error: SpotDL container failed to start."
fi
