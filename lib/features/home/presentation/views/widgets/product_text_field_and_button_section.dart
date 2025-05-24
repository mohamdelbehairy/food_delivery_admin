import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/buttons_list_view.dart';
import '../../../../../core/widgets/text_field_list_view.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import '../../manager/product/product_bloc.dart';

class ProductTextFieldAndButtonSection extends StatelessWidget {
  const ProductTextFieldAndButtonSection(
      {super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: product.formKey,
        child: Column(
          children: [
            TextFieldListView(list: product.textFieldItems(context)),
            const SizedBox(height: 20),
            ButtonsListView(
                buttons: product.buttonItems(context,
                    productDataModel: productDataModel)),
          ],
        ),
      ),
    );
  }
}
