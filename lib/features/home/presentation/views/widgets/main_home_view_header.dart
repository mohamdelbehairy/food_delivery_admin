import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'main_home_header_locaton.dart';
import 'main_home_header_notification_and_menu.dart';
import 'main_home_text.dart';

class MainHomeViewHeader extends StatelessWidget {
  const MainHomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imagesHomeHeader),
        const MainHomeHeaderLocation(),
        const MainHomeHeaderNotificationAndMenu(),
        const MainHomeText(),
      ],
    );
  }
}
