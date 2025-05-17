import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.text1, required this.text2});
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Text(text1, style: Styles.bold42),
        const SizedBox(height: 8),
        Text(text2, style: Styles.semiBold16),
      ],
    );
  }
}
