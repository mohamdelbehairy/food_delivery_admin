import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/cached_image_model.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.cachedImageModel});
  final CachedImageModel cachedImageModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(cachedImageModel.borderRadius ?? 0),
        child: CachedNetworkImage(
            imageUrl: cachedImageModel.imageUrl,
            height: cachedImageModel.height,
            width: cachedImageModel.width,
            fit: cachedImageModel.fit));
  }
}
