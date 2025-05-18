import 'package:flutter/material.dart';

class TextFieldModel {
  final String lable;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  TextFieldModel(
      {required this.lable,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.obscureText = true,
      this.keyboardType,
      this.validator});
}
