import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/cached_image_model.dart';
import '../../../../../core/widgets/custom_cached_image.dart';
import '../../../../../core/widgets/images_horizontal_list_view.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import '../../manager/product/product_bloc.dart';

class ProductViewImages extends StatelessWidget {
  const ProductViewImages({super.key, required this.productDataModel});

  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductBloc>();
    return ImagesHorizontalListView(
      children: productDataModel.productImages
          .asMap()
          .entries
          .map((e) => Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () =>
                          product.add(SelectProductImageEvent(index: e.key)),
                      child: CustomCachedImage(
                          cachedImageModel: CachedImageModel(
                              imageUrl: e.value,
                              height: 100,
                              fit: BoxFit.fill)),
                    ),
                  ),
                  if (product.selectProductImagesIndex.contains(e.key))
                    Positioned(
                      top: 5,
                      right: 5,
                      child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child:
                              Icon(Icons.close, color: Colors.white, size: 16)),
                    )
                ],
              ))
          .toList(),
    );
  }
}
