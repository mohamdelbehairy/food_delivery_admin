import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../../core/utils/service/firebase_storage_service.dart';
import '../../../../../core/utils/service/image_picker_service.dart';
import '../../../../home/presentation/manager/home/home_bloc.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import '../../views/widgets/product_category_bottom_sheet.dart';
import '../../views/widgets/product_suffix_icon.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final ImagePickerService _imagePickerService;
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseStorageService _firebaseStorageService;

  AddProductBloc(this._imagePickerService, this._firebaseStorageService,
      this._firebaseFirestoreService)
      : super(AddProductInitial()) {
    on<AddProductEvent>((event, emit) async {
      if (event is AddProductButtonEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          if (images == null || images!.isEmpty) {
            Helper.customSnackBar(event.context,
                message: "Please select product images");
          } else if (images!.length > 5) {
            Helper.customSnackBar(event.context,
                message: "You can select maximum 5 images");
          } else {
            isLoading = true;
            emit(AddProductLoading());
            final imagesUrl =
                await _firebaseStorageService.uploadImages(images!);
            final data = ProductDataModel(
                productID: const Uuid().v4(),
                productName: _productName!.text,
                productPrice: _productPrice!.text,
                productCategory: _productCategory!.text,
                productDescription: _productDescription!.text,
                ownerID: Helper.getIt.get<FirebaseAuth>().currentUser!.uid,
                productImages: imagesUrl,
                createdAt: DateTime.now());
            await _firebaseFirestoreService
                .addData(
              docID: data.productID,
              collectionName: Constants.productCollection,
              data: data.toJson(),
            )
                .then((value) {
              isLoading = false;
              emit(AddProductSuccess());
            }).catchError((error) {
              log("error from add product: $error");
              isLoading = false;
              emit(AddProductFailure());
            });
          }
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
        emit(SelectCategoryState());
      }
      if (event is ProductDefaultEvent) {
        _productName!.clear();
        _productPrice!.clear();
        _productCategory!.clear();
        _productDescription!.clear();
        images?.clear();
        images = null;
      }

      if (event is PickImageEvent) {
        images = await _imagePickerService.pickImages();
        if (images == null) return;
        emit(PickImageSuccess());
      }
      if (event is RemoveImageEvent) {
        if (images == null) return;
        images!.removeAt(event.index);
        emit(PickImageSuccess());
      }
    });
  }

  int categoryIndex = -1;
  bool isLoading = false;
  List<File>? images;

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
          lable: "Product Images",
          hintText: "Select Product Images here...",
          readOnly: true,
          suffixIcon: ProductSuffixIcon(
              isProductImage: true, onTap: () => add(PickImageEvent()))),
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

  @override
  Future<void> close() {
    _productName?.dispose();
    _productPrice?.dispose();
    _productCategory?.dispose();
    _productDescription?.dispose();
    return super.close();
  }
}
