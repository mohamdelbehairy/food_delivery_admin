import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/model/button_model.dart';
import 'package:food_delivery_admin/core/model/text_field_model.dart';
import 'package:food_delivery_admin/core/widgets/custom_button.dart';
import 'package:food_delivery_admin/core/widgets/text_field_list_view.dart';

import '../../../../product_data/data/model/product_data_model.dart';
import 'product_view_images.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          ProductViewImages(productDataModel: productDataModel),
          const SizedBox(height: 24),
          TextFieldListView(
            list: [
              TextFieldModel(
                lable: "Product Name",
                hintText: "Type something longer here...",
                controller:
                    TextEditingController(text: productDataModel.productName),
              ),
              TextFieldModel(
                lable: "Product Price",
                hintText: "Type something longer here...",
                readOnly: true,
                controller:
                    TextEditingController(text: productDataModel.productPrice),
              ),
              TextFieldModel(
                lable: "Product Category",
                hintText: "Select Product Category here...",
                controller: TextEditingController(
                    text: productDataModel.productCategory),
              ),
              TextFieldModel(
                lable: "Product Description",
                hintText: "Type something longer here...",
                controller: TextEditingController(
                    text: productDataModel.productDescription),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
              buttonModel: ButtonModel(
            buttonName: "Update Product",
          )),
          const SizedBox(height: 8),
          CustomButton(
              buttonModel: ButtonModel(
            buttonName: "Revert Product",
          )),
          const SizedBox(height: 8),
          CustomButton(
              buttonModel: ButtonModel(
            buttonName: "Delete Product",
          )),
        ],
      ),
    );
  }
}
