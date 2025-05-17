import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_header.dart';

class WelcomeViewHeader extends StatelessWidget {
  const WelcomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomHeader(text1: "Welcome", text2: "Lets get started"),
      ),
    );
  }
}

