import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product_data/data/model/product_data_model.dart';
import '../../manager/product/product_bloc.dart';
import 'product_text_field_and_button_section.dart';
import 'product_view_bloc_listener.dart';
import 'product_view_images.dart';
import 'product_view_pick_images.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductBloc>();
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        productViewBlocListener(state, context);
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              ProductViewImages(productDataModel: productDataModel),
              const SizedBox(height: 16),
              if (product.images != null)
                ProductViewsPickImages(productBloc: product),
              if (product.images != null && product.images!.isNotEmpty)
                const SizedBox(height: 24),
              ProductTextFieldAndButtonSection(
                  productDataModel: productDataModel),
            ],
          ),
        );
      },
    );
  }
}