import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/navigation.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import '../product_view.dart';
import 'product_item_image.dart';
import 'product_item_rate_and_distance_section.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.push(
          context, ProductView(productDataModel: productDataModel)),
      child: Container(
        // height: 204,
        width: 153,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductItemImage(imageUrl: productDataModel.productImages[0]),
            const SizedBox(height: 12),
            Text(productDataModel.productName, 
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.medium16),
            const SizedBox(height: 12),
            const ProductItemRateAndDistanceSection(),
            const SizedBox(height: 12),
            Text("EGP ${productDataModel.productPrice}", style: Styles.bold16),
          ],
        ),
      ),
    );
  }
}
