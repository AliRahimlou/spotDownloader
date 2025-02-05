# Use Python 3.11 as base image
FROM python:3.11

# Set working directory
WORKDIR /app

# Install FFmpeg and SpotDL
RUN apt-get update && apt-get install -y ffmpeg
RUN pip install spotdl

# Create a downloads directory inside the container and set permissions
RUN mkdir -p /app/downloads && chmod 777 /app/downloads

# Copy script into container
COPY download.py /app/download.py

# Set the entry point
CMD ["python", "/app/download.py"]
