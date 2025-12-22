import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppNetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.of(context).devicePixelRatio;

    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,

      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: ResizeImage(
                imageProvider,
                width: (width * dpr).round(),
                height: (height * dpr).round(),
              ),
              fit: fit,
            ),
          ),
        );
      },

      placeholder: (_, __) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: borderRadius,
        ),
      ),

      errorWidget: (_, __, ___) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: borderRadius,
        ),
        child: const Icon(Icons.broken_image, color: Colors.grey),
      ),

      fadeInDuration: const Duration(milliseconds: 300),
    );
  }
}
