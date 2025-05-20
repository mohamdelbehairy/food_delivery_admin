import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/constants.dart';
import 'package:food_delivery_admin/features/home/presentation/manager/home/home_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/navigation.dart';
import '../../views/widgets/product_category_bottom_sheet.dart';
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
      if (event is SelectCategoryEvent) {
        if (categoryIndex == event.index) return;
        categoryIndex = event.index;
        emit(SelectCategoryState());
      }
      if (event is CategoryButtonEvent) {
        if (event.index == -1) return;
        _productCategory!.text = Constants.categories[event.index];
        log("text: ${_productCategory!.text}");
        log("name: ${Constants.categories[event.index]}");
        emit(SelectCategoryState());
      }
    });
  }

  int categoryIndex = -1;

  TextEditingController? _productName;
  TextEditingController? _productPrice;
  TextEditingController? _productCategory;
  TextEditingController? _productDescription;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initTextFields() {
    _productName = TextEditingController();
    _productPrice = TextEditingController();
    _productCategory = TextEditingController();
    _productDescription = TextEditingController();
  }

  List<TextFieldModel> textFieldItems(BuildContext context) {
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
          if (_productName!.text.isEmpty) return null;
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
          hintText: "Select Product Category here...",
          readOnly: true,
          controller: _productCategory,
          suffixIcon: ProductCategorySuffixIcon(onTap: () async {
            final result = await showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) => ProductCategoryBottomSheet(onTap: () {
                      final index =
                          context.read<HomeBloc>().categoryProductIndex;
                      if (index == -1) return;
                      _productCategory!.text = Constants.categories[index];
                      Navigation.pop(context);
                    }));
            if (result == null) {
              // ignore: use_build_context_synchronously
              context.read<HomeBloc>().categoryProductIndex = -1;
            }
          }),
          validator: (value) {
            if (_productName!.text.isEmpty ||
                _productPrice!.text.isEmpty ||
                Helper.convertTextFieldPrice(_productPrice!.text)) {
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
            if (_productName!.text.isEmpty ||
                _productPrice!.text.isEmpty ||
                _productCategory!.text.isEmpty) {
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
    _productName?.dispose();
    _productPrice?.dispose();
    _productCategory?.dispose();
    _productDescription?.dispose();
    return super.close();
  }
}
