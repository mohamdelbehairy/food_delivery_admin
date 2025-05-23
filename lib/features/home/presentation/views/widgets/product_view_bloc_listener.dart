
  import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/navigation.dart';
import '../../manager/product/product_bloc.dart';

void productViewBlocListener(ProductState state, BuildContext context) {
    if (state is UpdateProductSuccess) {
      Helper.customSnackBar(context,
          message: "Product updated successfully");
      Navigation.pop(context);
    }
    if (state is CancleChanges) {
      Helper.customSnackBar(context, message: "Changes cancelled");
    }
    if (state is DeleteProductSuccess) {
      Helper.customSnackBar(context,
          message: "Product deleted successfully");
      Navigation.pop(context);
    }
  }