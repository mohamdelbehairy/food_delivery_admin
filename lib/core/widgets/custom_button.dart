import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/model/button_model.dart';
import 'package:food_delivery_admin/core/utils/app_colors.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';
import 'package:food_delivery_admin/core/widgets/loading_animation_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonModel});

  final ButtonModel buttonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonModel.onTap,
      child: Container(
        height: buttonModel.height ?? 48,
        width: buttonModel.width ?? double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: buttonModel.borderColor ?? Colors.white),
            color: buttonModel.backgroundColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: buttonModel.child ??
            Center(
              child: buttonModel.isLoading
                  ? const LoadingAnimationIndicator()
                  : Text(buttonModel.buttonName ?? "Sign in",
                      style: Styles.semiBold16.copyWith(color: Colors.white)),
            ),
      ),
    );
  }
}
