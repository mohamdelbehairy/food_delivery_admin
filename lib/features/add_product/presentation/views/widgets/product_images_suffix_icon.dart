import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/add_product/add_product_bloc.dart';
import 'product_suffix_icon.dart';

class ProductImagesSuffixIcon extends StatelessWidget {
  const ProductImagesSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final addProduct = context.read<AddProductBloc>();
    return ProductSuffixIcon(
        isProductImage: true, onTap: () => addProduct.add(PickImageEvent()));
  }
}
