# Cartoon Image App 🎨

![License](https://img.shields.io/badge/license-MIT-blue)
![Python](https://img.shields.io/badge/Python-3.9-blue)
![PyQt5](https://img.shields.io/badge/PyQt5-5.10.1-green)
![OpenCV](https://img.shields.io/badge/OpenCV-4.x-orange)
![Docker](https://img.shields.io/badge/Docker-Ready-brightgreen)

The **Cartoon Image App** is a Python application built with PyQt5 that transforms regular images into cartoon-style illustrations. With just a few clicks, you can create fun and unique cartoon versions of your photos.

## Features 🚀

- Transform images into cartoon style with customizable effects
- Intuitive controls to adjust cartoon parameters:
  - Edge detection sensitivity
  - Color smoothing intensity
  - Detail preservation
  - Downscaling factor
- Support for various image formats (JPEG, PNG, etc.)
- User-friendly graphical interface
- Batch processing capabilities
- Save output images in multiple formats

## Screenshots 📸

*[Screenshots will be added here]*

## Installation and Usage 🛠️

### Option 1: Standard Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/cartoon-image.git
```

2. Ensure you have Python 3.9 or later installed.

3. Install the required dependencies:

```bash
pip install PyQt5 opencv-python
```

4. Navigate to the project directory and run the application:

```bash
cd cartoon-image
python main.py
```

### Option 2: Docker Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/cartoon-image.git
```

2. Build the Docker image:

```bash
cd cartoon-image
docker build -t cartoon-image-app .
```

3. Run the application in a Docker container:

```bash
docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix cartoon-image-app
```

Note: For Docker on Windows or macOS, additional configuration may be required for GUI applications.

## How to Use 📝

1. Launch the application using one of the installation methods above.
2. Click the "Browse" button to select an image from your computer.
3. Adjust the cartoon effect parameters using the sliders:
   - Downscale Factor: Controls the image resolution
   - Bilateral Filter: Adjusts the smoothing effect
   - Sigma: Modifies edge detection sensitivity
   - Kernel Size: Changes the level of detail
4. Click "Generate" to create the cartoon version of your image.
5. Use the "Save" button to save the resulting image to your computer.
6. Click "Clear" to reset and start with a new image.

## Requirements 📋

- Python 3.9 or later
- PyQt5
- OpenCV (cv2)
- Docker (optional, for containerized usage)

## Contributing 💡

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments 🙏

- Thanks to the PyQt and OpenCV communities for their excellent libraries
- Inspired by various image processing techniques and tutorials