import 'package:flutter/material.dart';

import 'main_home_category_section.dart';

class MainHomeViewComponents extends StatelessWidget {
  const MainHomeViewComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainHomeCategorySection(),
      ],
    );
  }
}
