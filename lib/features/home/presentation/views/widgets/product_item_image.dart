import 'package:flutter/material.dart';

import '../../../../../core/model/cached_image_model.dart';
import '../../../../../core/widgets/custom_cached_image.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCachedImage(
          cachedImageModel: CachedImageModel(
              imageUrl: imageUrl,
              height: 125,
              borderRadius: 8,
              fit: BoxFit.cover)),
    );
  }
}
