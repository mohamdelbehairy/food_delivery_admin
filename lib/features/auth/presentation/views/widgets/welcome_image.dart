import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key, this.image, this.alignment});
  final String? image;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment ?? Alignment.topRight,
        child: Image.asset(image ?? Assets.imagesX));
  }
}
