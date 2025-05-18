import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_header.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        height: 1,
        text1: "Forgot\npassword?",
        text2:
            "Enter your email for the verification process,\nwe will send code to your email");
  }
}