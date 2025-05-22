import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../product_data/data/model/product_data_model.dart';
import '../../../product_data/data/repo/product_data_repo_impl.dart';
import '../manager/product/product_bloc.dart';
import 'widgets/product_app_bar.dart';
import 'widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(Helper.getIt.get<ProductDataRepoImpl>())
        ..initTextFields(productDataModel),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: productAppBar(context),
          body: ProductViewBody(productDataModel: productDataModel)),
    );
  }
}
