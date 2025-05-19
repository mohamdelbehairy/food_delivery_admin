import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class ProductItemRate extends StatelessWidget {
  const ProductItemRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 18, color: AppColors.primaryColor),
        const SizedBox(width: 6),
        Text("4.9",
            style: Styles.medium12.copyWith(color: AppColors.blackColor)),
      ],
    );
  }
}
