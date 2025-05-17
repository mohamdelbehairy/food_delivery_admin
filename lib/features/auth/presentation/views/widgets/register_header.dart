import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_header.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeader(text1: "Sign up", text2: "Please create a new account");
  }
}
