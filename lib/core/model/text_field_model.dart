import 'package:flutter/material.dart';

class TextFieldModel {
  final String? lable, hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText, readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  TextFieldModel(
      {this.lable,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.obscureText = true,
      this.keyboardType,
      this.validator,
      this.readOnly = false});
}
