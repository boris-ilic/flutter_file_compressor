import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:light_compressor/light_compressor.dart';

enum CompressionType { image, video }

class FlutterFileCompressor {
  static Future<dynamic> compressFile({
    required String filePath,
    required int quality,
    required CompressionType compressionType,
  }) async {
    switch (compressionType) {
      case CompressionType.image:
        return compressImage(filePath, quality);
      case CompressionType.video:
        return compressVideo(filePath, quality);

      default:
        return null;
    }
  }

  static Future<Uint8List?> compressImage(String filePath, int quality) async {
    var result = await FlutterImageCompress.compressWithFile(
      filePath,
      quality: quality,
      keepExif: true,
    );
    return result;
  }

  static Future<Result?> compressVideo(String filePath, int quality) async {
    final LightCompressor lightCompressor = LightCompressor();
    final VideoQuality videoQuality = _mapQuality(quality);

    final Result response = await lightCompressor.compressVideo(
      path: filePath,
      videoQuality: videoQuality,
      isMinBitrateCheckEnabled: false,
      video: Video(videoName: ''),
      android: AndroidConfig(isSharedStorage: true, saveAt: SaveAt.Movies),
      ios: IOSConfig(saveInGallery: true),
    );
    return response;
  }

  static VideoQuality _mapQuality(int quality) {
    if (quality <= 20) {
      return VideoQuality.very_low;
    } else if (quality <= 40) {
      return VideoQuality.low;
    } else if (quality <= 60) {
      return VideoQuality.medium;
    } else if (quality <= 80) {
      return VideoQuality.high;
    } else {
      return VideoQuality.very_high;
    }
  }
}
