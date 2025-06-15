# Use Python 3.9 as the base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for OpenCV and PyQt5
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libxcb-xinerama0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    xvfb \
    x11-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Set environment variable for display
ENV DISPLAY=:0

# Create a script to run the application with Xvfb if needed
RUN echo '#!/bin/bash\nif [ -z "$DISPLAY" ]; then\n  Xvfb :0 -screen 0 1024x768x16 &\n  python main.py\nelse\n  python main.py\nfi' > /app/entrypoint.sh \
    && chmod +x /app/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]