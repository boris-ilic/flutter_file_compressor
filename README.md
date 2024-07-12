
# Project Title

A brief description of what this project does and who it's for

# Flutter File Compressor

Flutter File Compressor is a lightweight and efficient package for compressing images and videos in Flutter applications. It provides a simple API to compress files while maintaining aspect ratios, making it ideal for applications that need to manage file sizes effectively.

## Features

- Compress images and videos.
- Simple and easy-to-use API.
- Supports both Android and iOS platforms.

## Installation

Add `flutter_file_compressor` to your Flutter project by adding the following line to your `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  flutter_file_compressor: ^1.0.0# flutter_file_compressor
```

## Usage

```usage
await FlutterFileCompressor.compressFile(
        filePath: _filePath,
        quality: 70, //percent
        compressionType: CompressionType.image, //CompressionType.video
      )
