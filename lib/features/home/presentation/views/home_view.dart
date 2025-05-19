import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home/home_bloc.dart';
import 'widgets/bottom_nav_bar_widget.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(),
        child: Scaffold(
          body: const HomeViewBody(),
          bottomNavigationBar: const BottomNavBarWidget(),
        ));
  }
}
