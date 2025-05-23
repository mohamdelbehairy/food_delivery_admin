import 'package:flutter/material.dart';

import 'widgets/bottom_nav_bar_widget.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
