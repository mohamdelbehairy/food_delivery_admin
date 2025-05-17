import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_header.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        text1: "Sign in", text2: "Please log in into your account");
  }
}
