import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.color,
    this.errorWidget,
  });

  final String imageUrl;
  final double width;
  final double height;
  final Color? color;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.contain,
      color: color,
      errorWidget: (context, url, error) {
        return errorWidget ??
            SizedBox(
              width: width,
              height: height,
              child: Icon(Icons.error_outline, size: 24.h, color: Colors.red),
            );
      },
    );
  }
}
