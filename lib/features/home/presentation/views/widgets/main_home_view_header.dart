import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'main_home_header_locaton.dart';
import 'main_home_header_search_and_notification.dart';
import 'main_home_text.dart';

class MainHomeViewHeader extends StatelessWidget {
  const MainHomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imagesHomeHeader),
        const MainHomeHeaderLocation(),
        const MainHomeHeaderSearchAndNotification(),
        const MainHomeText(),
      ],
    );
  }
}
