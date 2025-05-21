import 'package:flutter/material.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/text_field_list_view.dart';
import '../../manager/add_product/add_product_bloc.dart';

class AddProductListViewAndButtonSection extends StatelessWidget {
  const AddProductListViewAndButtonSection(
      {super.key, required this.addProduct});

  final AddProductBloc addProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          TextFieldListView(list: addProduct.textFieldItems(context)),
          const SizedBox(height: 24),
          CustomButton(
              buttonModel: ButtonModel(
                  buttonName: "Add Product",
                  isLoading: addProduct.isLoading,
                  onTap: () => addProduct.add(AddProductButtonEvent()))),
        ],
      ),
    );
  }
}