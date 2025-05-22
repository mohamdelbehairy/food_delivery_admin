import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/alert_dialog_model.dart';
import '../../../../../core/model/button_model.dart';
import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../add_product/presentation/views/widgets/product_category_bottom_sheet.dart';
import '../../../../add_product/presentation/views/widgets/product_suffix_icon.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import '../home/home_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FirebaseFirestoreService _firebaseFirestoreService;
  ProductBloc(this._firebaseFirestoreService) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is UpdateProductEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          if (checkTextFieldsChange(event.productDataModel)) {
            isUpdateLoading = true;
            emit(ProductLoading());
            final date = event.productDataModel.copyWith(
                productName: _productName!.text,
                productPrice: _productPrice!.text,
                productCategory: _productCategory!.text,
                productDescription: _productDescription!.text);
            await _firebaseFirestoreService
                .updataData(
                    collectionName: Constants.productCollection,
                    docID: event.productDataModel.productID,
                    data: date.toJson())
                .then((value) {
              isUpdateLoading = false;
              emit(UpdateProductSuccess());
            }).catchError((error) {
              log("error from update product: $error");
              isUpdateLoading = false;
              emit(ProductFailure(error.code));
            });
          }
        }
      }

      if (event is CancelChangesEvent) {
        if (checkTextFieldsChange(event.productDataModel)) {
          initTextFields(event.productDataModel);
          emit(CancleChanges());
        }
      }

      if (event is DeleteProductEvent) {
        isDeleteLoading = true;
        emit(ProductLoading());
        await _firebaseFirestoreService
            .deleteData(
                collectionName: Constants.productCollection,
                docID: event.productID)
            .then((value) {
          isDeleteLoading = false;
          emit(DeleteProductSuccess());
        }).catchError((error) {
          log("error from delete product: $error");
          isDeleteLoading = false;
          emit(ProductFailure(error.code));
        });
      }
    });
  }

  bool checkTextFieldsChange(ProductDataModel productDataModel) {
    return _productName!.text != productDataModel.productName ||
        _productPrice!.text != productDataModel.productPrice ||
        _productCategory!.text != productDataModel.productCategory ||
        _productDescription!.text != productDataModel.productDescription;
  }

  bool isUpdateLoading = false;
  bool isDeleteLoading = false;

  TextEditingController? _productName;
  TextEditingController? _productPrice;
  TextEditingController? _productCategory;
  TextEditingController? _productDescription;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initTextFields(ProductDataModel productDataModel) {
    _productName = TextEditingController(text: productDataModel.productName);
    _productPrice = TextEditingController(text: productDataModel.productPrice);
    _productCategory =
        TextEditingController(text: productDataModel.productCategory);
    _productDescription =
        TextEditingController(text: productDataModel.productDescription);
  }

  List<TextFieldModel> textFieldItems(BuildContext context) {
    return [
      // TextFieldModel(
      //     lable: "Product Images",
      //     hintText: "Select Product Images here...",
      //     readOnly: true,
      //     suffixIcon: const ProductImagesSuffixIcon()),
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
          if (_productName!.text.isEmpty) {
            return null;
          }
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
          suffixIcon: ProductSuffixIcon(onTap: () async {
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

  List<ButtonModel> buttonItems(BuildContext context,
      {required ProductDataModel productDataModel}) {
    return [
      ButtonModel(
          isLoading: isUpdateLoading,
          buttonName: "Update Product",
          onTap: () => add(UpdateProductEvent(productDataModel))),
      ButtonModel(
          buttonName: "Cancel Changes",
          onTap: () => add(CancelChangesEvent(productDataModel))),
      ButtonModel(
        isLoading: isDeleteLoading,
        buttonName: "Delete Product",
        onTap: () => showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
            alertDialogModel: AlertDialogModel(
              title: "Delete Product",
              buttonName: "Delete",
              content: "Do you want to delete this product?",
              onTap: () {
                Navigation.pop(context);
                add(DeleteProductEvent(productDataModel.productID));
              },
            ),
          ),
        ),
      )
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
