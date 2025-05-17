import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text("Forgot password?",
          style: Styles.semiBold14.copyWith(color: const Color(0xffF78720))),
    );
  }
}