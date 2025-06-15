#!/bin/bash

# Build the Docker image if it doesn't exist
if [[ "$(docker images -q cartoon-image-app 2> /dev/null)" == "" ]]; then
  echo "Building Docker image..."
  docker build -t cartoon-image-app .
fi

# Run the Docker container with X11 forwarding
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  xhost +local:docker
  docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$(pwd)/images:/app/images" \
    cartoon-image-app
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  echo "On macOS, you need XQuartz installed and configured for X11 forwarding."
  echo "Please follow these steps:"
  echo "1. Install XQuartz: brew install --cask xquartz"
  echo "2. Open XQuartz and go to Preferences > Security and check 'Allow connections from network clients'"
  echo "3. Restart XQuartz"
  echo "4. Run: xhost + $(hostname)"
  echo "5. Then run this script again"
  
  # Uncomment the following lines after setting up XQuartz
  # IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
  # xhost + $IP
  # docker run --rm -it \
  #   -e DISPLAY=$IP:0 \
  #   -v "$(pwd)/images:/app/images" \
  #   cartoon-image-app
elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
  # Windows
  echo "On Windows, you need an X server like VcXsrv or Xming."
  echo "Please follow these steps:"
  echo "1. Install VcXsrv or Xming"
  echo "2. Start the X server with 'Disable access control' checked"
  echo "3. Set DISPLAY environment variable: set DISPLAY=host.docker.internal:0.0"
  echo "4. Then run: docker run --rm -it -e DISPLAY=host.docker.internal:0.0 -v %cd%/images:/app/images cartoon-image-app"
fi