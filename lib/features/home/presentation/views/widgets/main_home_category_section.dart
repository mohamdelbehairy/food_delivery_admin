import 'package:flutter/material.dart';

import 'main_home_category_header.dart';
import 'main_home_category_list_view.dart';

class MainHomeCategorySection extends StatelessWidget {
  const MainHomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainHomeCategoryHeader(),
        const SizedBox(height: 20),
        const MainHomeCategoryListView(),
      ],
    );
  }
}
