import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product_data/data/model/product_data_model.dart';
import '../../manager/home/home_bloc.dart';
import 'product_item.dart';

class MainHomeViewGridView extends StatelessWidget {
  const MainHomeViewGridView({super.key, this.productsList});
  final List<ProductDataModel>? productsList;

  @override
  Widget build(BuildContext context) {
    final products = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GridView.builder(
                itemCount: productsList?.length ?? products.productsList.length,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.35,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) => ProductItem(
                    productDataModel:
                        productsList?[index] ?? products.productsList[index])),
          ),
        );
      },
    );
  }
}
