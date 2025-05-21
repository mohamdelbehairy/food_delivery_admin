import 'package:flutter/material.dart';

import '../../../product_data/data/model/product_data_model.dart';
import 'widgets/product_app_bar.dart';
import 'widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: productAppBar(context),
        body: ProductViewBody(productDataModel: productDataModel));
  }
}
