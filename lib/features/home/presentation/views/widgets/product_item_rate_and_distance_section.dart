import 'package:flutter/material.dart';

import 'product_item_distance.dart';
import 'product_item_rate.dart';

class ProductItemRateAndDistanceSection extends StatelessWidget {
  const ProductItemRateAndDistanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ProductItemRate(),
        const ProductItemDistance(),
      ],
    );
  }
}
