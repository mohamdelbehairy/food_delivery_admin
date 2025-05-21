import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/model/button_model.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';
import 'package:food_delivery_admin/core/widgets/custom_button.dart';

import '../../../../../core/widgets/text_field_list_view.dart';
import '../../manager/add_product/add_product_bloc.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final addProduct = context.read<AddProductBloc>();
    return BlocConsumer<AddProductBloc, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          addProduct.add(ProductDefaultEvent());
          Helper.customSnackBar(context, message: "Product added successfully");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: addProduct.formKey,
            child: Column(
              children: [
                TextFieldListView(list: addProduct.textFieldItems(context)),
                const SizedBox(height: 24),
                CustomButton(
                    buttonModel: ButtonModel(
                        buttonName: "Add Product",
                        isLoading: addProduct.isLoading,
                        onTap: () => addProduct.add(AddProductButtonEvent())))
              ],
            ),
          ),
        );
      },
    );
  }
}
