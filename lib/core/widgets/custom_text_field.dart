import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/model/text_field_model.dart';
import 'package:food_delivery_admin/core/utils/app_colors.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';

import '../utils/helper.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.semiBold16,
      validator: textFieldModel.validator,
      controller: textFieldModel.controller,
      cursorColor: AppColors.primaryColor,
      obscureText: !textFieldModel.obscureText,
      keyboardType: textFieldModel.keyboardType,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF5F5F5),
          hintText: textFieldModel.hintText,
          hintStyle: Styles.mediumItalic16,
          border: Helper.buildBorder(),
          enabledBorder: Helper.buildBorder(),
          focusedBorder: Helper.buildBorder(),
          suffixIcon: textFieldModel.suffixIcon),
    );
  }
}
