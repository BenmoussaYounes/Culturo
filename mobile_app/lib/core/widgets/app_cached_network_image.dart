import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.errorWidget,
  });

  final String imageUrl;
  final double width;
  final double height;

  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorWidget: errorWidget != null ? (context, url, error) => errorWidget! : null,
    );
  }
}
