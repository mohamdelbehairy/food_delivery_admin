import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/helper.dart';
import '../../views/widgets/product_category_suffix_icon.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductEvent>((event, emit) {
      if (event is AddProductButtonEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        }
      }
    });
  }

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productCategory = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextFieldModel> textFieldItems() {
    return [
      TextFieldModel(
          lable: "Product Name",
          hintText: "Type something longer here...",
          controller: _productName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Product name is required";
            }
            return null;
          }),
      TextFieldModel(
        lable: "Product Price",
        hintText: "Type something longer here...",
        controller: _productPrice,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (_productName.text.isEmpty) return null;
          if (value == null || value.isEmpty) {
            return "Product price is required";
          }

          final convertToNumber = num.tryParse(value);
          if (convertToNumber == null ||
              (convertToNumber.runtimeType != int &&
                  convertToNumber.runtimeType != double)) {
            return "Product price must be a number";
          }
          if (double.parse(value) <= 0) {
            return "Product price must be greater than 0";
          }
          return null;
        },
      ),
      TextFieldModel(
          lable: "Product Category",
          hintText: "Type something longer here...",
          readOnly: true,
          controller: _productCategory,
          suffixIcon: const ProductCategorySuffixIcon(),
          validator: (value) {
            if (_productName.text.isEmpty ||
                _productPrice.text.isEmpty ||
                Helper.convertTextFieldPrice(_productPrice.text)) {
              return null;
            }
            if (value == null || value.isEmpty) {
              return "Product Category is required";
            }
            return null;
          }),
      TextFieldModel(
          lable: "Product Description",
          hintText: "Type something longer here...",
          controller: _productDescription,
          validator: (value) {
            if (_productName.text.isEmpty ||
                _productPrice.text.isEmpty ||
                _productCategory.text.isEmpty) {
              return null;
            }
            if (value == null || value.isEmpty) {
              return "Product Description is required";
            }
            return null;
          }),
    ];
  }

  @override
  Future<void> close() {
    _productName.dispose();
    _productPrice.dispose();
    _productCategory.dispose();
    _productDescription.dispose();
    return super.close();
  }
}
