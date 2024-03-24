import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../utils/assets_manager.dart';

class AppNetworkImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;

  const AppNetworkImage({
    super.key,
    required this.image,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return Gif(
            image: const AssetImage(AssetsManager.gifLoading),
            fps: 15,
            fit: BoxFit.cover,
            width: width,
            height: height ?? 240.0,
            autostart: Autostart.loop,
          );
        } else {
          return child;
        }
      },
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(
          AssetsManager.imgImageNotFound,
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
