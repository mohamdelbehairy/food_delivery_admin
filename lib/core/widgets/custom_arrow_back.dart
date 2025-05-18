import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';

import '../utils/app_colors.dart';
import '../utils/navigation.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.pop(context),
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios, size: 18, color: AppColors.blackColor),
          const SizedBox(width: 12),
          Text("Back", style: Styles.semiBold14),
        ],
      ),
    );
  }
}
