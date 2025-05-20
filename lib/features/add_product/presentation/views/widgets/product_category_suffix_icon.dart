import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductCategorySuffixIcon extends StatelessWidget {
  const ProductCategorySuffixIcon({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.rotate(
          angle: -90 * 3.14 / 180,
          child: const Icon(Icons.arrow_back_ios_new_outlined,
              size: 16, color: AppColors.blackColor)),
    );
  }
}
