import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/alert_dialog_model.dart';
import '../../../../../core/model/button_model.dart';
import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../../core/utils/service/firebase_storage_service.dart';
import '../../../../../core/utils/service/image_picker_service.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../add_product/presentation/views/widgets/product_category_bottom_sheet.dart';
import '../../../../add_product/presentation/views/widgets/product_suffix_icon.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import '../home/home_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ImagePickerService _imagePickerService;
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseStorageService _firebaseStorageService;

  ProductBloc(this._imagePickerService, this._firebaseFirestoreService,
      this._firebaseStorageService)
      : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is SelectProductImageEvent) {
        if (selectProductImagesIndex.contains(event.index)) {
          selectProductImagesIndex.remove(event.index);
          emit(SelectProductImageState());
        } else {
          selectProductImagesIndex.add(event.index);
          emit(SelectProductImageState());
        }
      }
      if (event is UpdateProductEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          final updatedImages = [...event.productDataModel.productImages];
          if (selectProductImagesIndex.isNotEmpty) {
            selectProductImagesIndex.sort((a, b) => b.compareTo(a));
            for (final index in selectProductImagesIndex) {
              updatedImages.removeAt(index);
            }
          }

          if (selectProductImagesIndex.length ==
                  event.productDataModel.productImages.length &&
              images == null) {
            Helper.customSnackBar(event.context,
                message: "You must keep at least one image.");
            return;
          }

          if (images != null && updatedImages.length + images!.length > 5) {
            Helper.customSnackBar(event.context,
                message: "Your prouct can't have more than 5 images.");
            return;
          }

          List<String> imagesUrls = [];
          if (images != null && updatedImages.length + images!.length <= 5) {
            _isUpdateLoading = true;
            emit(ProductLoading());
            imagesUrls = await _firebaseStorageService.uploadImages(images!);
            updatedImages.addAll(imagesUrls);
          }

          final hasImagesChanged = selectProductImagesIndex.isNotEmpty;
          final hasTextChanged = _checkTextFieldsChange(event.productDataModel);
          final hasPickImages = updatedImages.length !=
              event.productDataModel.productImages.length;

          if (hasImagesChanged || hasTextChanged || hasPickImages) {
            final updatedProduct = event.productDataModel.copyWith(
                productImages: updatedImages,
                productName: _productName!.text,
                productPrice: _productPrice!.text,
                productCategory: _productCategory!.text,
                productDescription: _productDescription!.text);

            await _updateProduct(updatedProduct, emit);
          }
        }
      }
      if (event is PickImageEvent) {
        images = await _imagePickerService.pickImages();
        if (images == null) return;
        emit(PickImageSuccess());
      }
      if (event is RemovePickImageEvent) {
        if (images == null) return;
        images!.removeAt(event.index);
        emit(PickImageSuccess());
      }

      if (event is CancelChangesEvent) {
        final hasTextChanges = _checkTextFieldsChange(event.productDataModel);
        final hasSelectedImages = selectProductImagesIndex.isNotEmpty;
        final hasImages = images != null && images!.isNotEmpty;

        if (hasTextChanges || hasSelectedImages || hasImages) {
          if (hasTextChanges) {
            initTextFields(event.productDataModel);
          }
          if (hasSelectedImages) {
            selectProductImagesIndex.clear();
          }
          if (hasImages) {
            images?.clear();
            images = null;
          }
          emit(CancleChanges());
        }
      }

      if (event is DeleteProductEvent) {
        _isDeleteLoading = true;
        emit(ProductLoading());
        await _firebaseFirestoreService
            .deleteData(
                collectionName: Constants.productCollection,
                docID: event.productID)
            .then((value) {
          _isDeleteLoading = false;
          emit(DeleteProductSuccess());
        }).catchError((error) {
          log("error from delete product: $error");
          _isDeleteLoading = false;
          emit(ProductFailure(error.code));
        });
      }
    });
  }

  Future<void> _updateProduct(
      ProductDataModel date, Emitter<ProductState> emit) async {
    _isUpdateLoading = true;
    emit(ProductLoading());
    await _firebaseFirestoreService
        .updataData(
            collectionName: Constants.productCollection,
            docID: date.productID,
            data: date.toJson())
        .then((value) {
      _isUpdateLoading = false;
      emit(UpdateProductSuccess());
    }).catchError((error) {
      log("error from update product: $error");
      _isUpdateLoading = false;
      emit(ProductFailure(error.code));
    });
  }

  bool _checkTextFieldsChange(ProductDataModel productDataModel) {
    return _productName!.text != productDataModel.productName ||
        _productPrice!.text != productDataModel.productPrice ||
        _productCategory!.text != productDataModel.productCategory ||
        _productDescription!.text != productDataModel.productDescription;
  }

  List<File>? images;
  bool _isUpdateLoading = false;
  bool _isDeleteLoading = false;

  TextEditingController? _productName;
  TextEditingController? _productPrice;
  TextEditingController? _productCategory;
  TextEditingController? _productDescription;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<int> selectProductImagesIndex = [];

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

  List<ButtonModel> buttonItems(BuildContext context,
      {required ProductDataModel productDataModel}) {
    return [
      ButtonModel(
          isLoading: _isUpdateLoading,
          buttonName: "Update Product",
          onTap: () => add(
              UpdateProductEvent(context, productDataModel: productDataModel))),
      ButtonModel(
          buttonName: "Cancel Changes",
          onTap: () => add(CancelChangesEvent(productDataModel))),
      ButtonModel(
        isLoading: _isDeleteLoading,
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
