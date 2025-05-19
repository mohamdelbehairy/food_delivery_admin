import 'package:flutter/material.dart';

import 'main_home_view_components.dart';
import 'main_home_view_header.dart';

class MainHomeViewBody extends StatelessWidget {
  const MainHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainHomeViewHeader(),
        SizedBox(height: 24),
        MainHomeViewComponents(),
      ],
    );
  }
}
