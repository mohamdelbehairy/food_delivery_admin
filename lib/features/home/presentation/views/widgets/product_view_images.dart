import 'package:flutter/material.dart';

import '../../../../../core/model/cached_image_model.dart';
import '../../../../../core/widgets/custom_cached_image.dart';
import '../../../../../core/widgets/images_horizontal_list_view.dart';
import '../../../../product_data/data/model/product_data_model.dart';

class ProductViewImages extends StatelessWidget {
  const ProductViewImages({super.key, required this.productDataModel});

  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return ImagesHorizontalListView(
      children: productDataModel.productImages
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedImage(
                    cachedImageModel: CachedImageModel(
                        imageUrl: e, height: 100, fit: BoxFit.fill)),
              ))
          .toList(),
    );
  }
}