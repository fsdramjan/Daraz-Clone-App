// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  String? imageUrl;

  double? height;
  double? width;
  BoxFit? fit;
  bool? isImgCircular;
  BorderRadius? borderRadius;
  BlendMode? colorBlendMode;
  Color? color;

  CachedNetworkImageWidget({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.isImgCircular,
    this.borderRadius,
    this.colorBlendMode,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isImgCircular == true
          ? borderRadius ?? BorderRadius.circular(5)
          : BorderRadius.circular(5),
      child: CachedNetworkImage(
        imageUrl: imageUrl.toString(),
        height: height == null ? 50 : height,
        width: width == null ? 50 : width,
        fit: fit,
        colorBlendMode: colorBlendMode,
        color: color,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: loadingAnimation(),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
