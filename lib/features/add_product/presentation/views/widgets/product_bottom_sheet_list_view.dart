import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/home/home_bloc.dart';
import 'product_bottom_sheet_item.dart';

class ProductBottomSheetListView extends StatelessWidget {
  const ProductBottomSheetListView({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: home
              .bottomSheetItems()
              .asMap()
              .entries
              .map((e) => GestureDetector(
                  onTap: () => home.add(SelectProductCategoryEvent(e.key)),
                  child: ProductBottomSheetItem(
                      isActive: e.key == home.categoryProductIndex,
                      productItemModel: e.value)))
              .toList(),
        );
      },
    );
  }
}
