import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductCategorySuffixIcon extends StatelessWidget {
  const ProductCategorySuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -90 * 3.14 / 180,
        child: Icon(Icons.arrow_back_ios_new_outlined,
            size: 16, color: AppColors.blackColor));
  }
}
