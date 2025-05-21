import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home/home_bloc.dart';
import 'all_products_view_header.dart';
import 'main_home_view_grid_view.dart';

class AllProductsViewBody extends StatelessWidget {
  const AllProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final prodcut = context.read<HomeBloc>();
    return Column(
      children: [
        const SizedBox(height: 8),
        const AlProductsViewHeader(),
        const SizedBox(height: 32),
        MainHomeViewGridView(productsList: prodcut.allProductsList),
      ],
    );
  }
}
