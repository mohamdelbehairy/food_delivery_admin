import 'package:flutter/material.dart';

import 'main_home_view_header.dart';

class MainHomeViewBody extends StatelessWidget {
  const MainHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainHomeViewHeader(),
      ],
    );
  }
}
