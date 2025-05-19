import 'package:flutter/material.dart';

import 'main_home_category_section.dart';
import 'main_home_view_grid_view.dart';
import 'main_home_view_header.dart';

class MainHomeViewBody extends StatelessWidget {
  const MainHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainHomeViewHeader(),
        const SizedBox(height: 24),
        const MainHomeCategorySection(),
        const SizedBox(height: 24),
        const MainHomeViewGridView(),
      ],
    );
  }
}
