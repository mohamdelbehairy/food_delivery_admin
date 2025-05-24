import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/service/firebase_storage_service.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../core/utils/service/image_picker_service.dart';
import '../../../product_data/data/model/product_data_model.dart';
import '../manager/product/product_bloc.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
          Helper.getIt.get<ImagePickerService>(),
          Helper.getIt.get<FirebaseFirestoreService>(),
          Helper.getIt.get<FirebaseStorageService>())
        ..initTextFields(productDataModel),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar(context),
          body: ProductViewBody(productDataModel: productDataModel)),
    );
  }
}
