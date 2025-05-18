import 'package:flutter/material.dart';

import 'welcome_view_buttons.dart';
import 'welcome_view_components.dart';
import 'welcome_view_header.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const WelcomeViewComponents(),
        const WelcomeViewHeader(),
        const WelcomeViewButtons(),
      ],
    );
  }
}
