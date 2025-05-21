import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/navigation.dart';

import '../../../../../core/utils/styles.dart';
import '../all_products_view.dart';

class MainHomeCategoryHeader extends StatelessWidget {
  const MainHomeCategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Find by Category", style: Styles.semiBold16),
          GestureDetector(
              onTap: () => Navigation.push(context, const AllProductsView()),
              child: const Text("See All", style: Styles.medium14))
        ],
      ),
    );
  }
}
