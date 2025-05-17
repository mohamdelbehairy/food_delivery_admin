import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/app_colors.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text("Sign in",
              style: Styles.semiBold16.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
