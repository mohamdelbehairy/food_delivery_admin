import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductSuffixIcon extends StatelessWidget {
  const ProductSuffixIcon(
      {super.key, required this.onTap, this.isProductImage = false});
  final bool isProductImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.rotate(
          angle: isProductImage ? 0.0 : -90 * 3.14 / 180,
          child: Icon(
              isProductImage
                  ? Icons.camera_alt_outlined
                  : Icons.arrow_back_ios_new_outlined,
              size: 16,
              color: AppColors.blackColor)),
    );
  }
}
