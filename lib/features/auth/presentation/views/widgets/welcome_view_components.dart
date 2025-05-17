import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/assets.dart';
import 'welcome_image.dart';

class WelcomeViewComponents extends StatelessWidget {
  const WelcomeViewComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomeImage(),
        const SizedBox(height: 32),
        WelcomeImage(alignment: Alignment.centerLeft, image: Assets.imagesR)
      ],
    );
  }
}
