import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class WelcomeViewHeader extends StatelessWidget {
  const WelcomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text("Welcome", style: Styles.bold42),
            SizedBox(height: 8),
            Text("Lets get started", style: Styles.semiBold16),
          ],
        ),
      ),
    );
  }
}
