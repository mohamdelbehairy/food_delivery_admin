import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class Styles {
  // bold
  static const bold42 = TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      fontFamily: "PlusJakartaSans",
      color: AppColors.primaryColor);

  // semi bold
  static const semiBold16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "PlusJakartaSans",
      color: AppColors.blackColor);

  static const semiBold14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: "PlusJakartaSans",
      color: AppColors.blackColor);

  static const semiBold32 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      fontFamily: "PlusJakartaSans",
      color: Colors.white);

  //medium
  static const mediumItalic16 = TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
      fontFamily: "PlusJakartaSans",
      color: AppColors.blackColor);

  static const medium10 = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: "PlusJakartaSans",
      color: AppColors.primaryColor);

  static const medium12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff878787));

  static const mediumItalic14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff878787));

  static const medium14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "PlusJakartaSans",
      color: AppColors.primaryColor);

  // regular
  static const regular14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      color: Colors.white);
}
