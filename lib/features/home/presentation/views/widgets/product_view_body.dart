import 'package:flutter/material.dart';

import '../../../../product_data/data/model/product_data_model.dart';
import 'product_text_field_and_button_section.dart';
import 'product_view_images.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          ProductViewImages(productDataModel: productDataModel),
          const SizedBox(height: 24),
          ProductTextFieldAndButtonSection(productDataModel: productDataModel),
        ],
      ),
    );
  }
}
