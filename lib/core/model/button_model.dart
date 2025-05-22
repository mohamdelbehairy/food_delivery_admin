import 'package:flutter/material.dart';

class ButtonModel {
  final String? buttonName;
  final double? height, width;
  final Color? borderColor, backgroundColor;
  final bool isLoading;
  final Function()? onTap;
  final Widget? child;

  ButtonModel(
      {this.buttonName,
      this.height,
      this.width,
      this.borderColor,
      this.backgroundColor,
      this.isLoading = false,
      this.onTap,
      this.child});
}
