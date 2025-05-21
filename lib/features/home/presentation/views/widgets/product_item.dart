import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import 'product_item_image.dart';
import 'product_item_rate_and_distance_section.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 204,
      width: 153,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductItemImage(),
          const SizedBox(height: 12),
          Text(productDataModel.productName, style: Styles.medium16),
          const SizedBox(height: 12),
          const ProductItemRateAndDistanceSection(),
          const SizedBox(height: 12),
          Text("\$ ${productDataModel.productPrice}", style: Styles.bold16),
        ],
      ),
    );
  }
}
