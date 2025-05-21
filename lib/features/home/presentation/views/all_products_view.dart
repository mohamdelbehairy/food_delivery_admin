import 'package:flutter/material.dart';

import 'widgets/all_products_view_body.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF9F9F9).withValues(alpha: 1),
      body: SafeArea(child: AllProductsViewBody()),
    );
  }
}
