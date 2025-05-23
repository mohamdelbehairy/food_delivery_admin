import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home/home_bloc.dart';
import 'widgets/main_home_view_drawer.dart';
import 'widgets/main_home_view_body.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeBloc>();
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9).withValues(alpha: .8),
      drawer: const MainHomeViewDrawer(),
      key: home.homeKey,
      body: const MainHomeViewBody(),
    );
  }
}
