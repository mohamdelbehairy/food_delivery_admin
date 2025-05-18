import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key, required this.text1, required this.text2, this.height});
  final String text1, text2;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Text(text1, style: Styles.bold42.copyWith(height: height)),
        SizedBox(height: height != null ? 20 : 8),
        Text(text2, style: Styles.semiBold16),
      ],
    );
  }
}
