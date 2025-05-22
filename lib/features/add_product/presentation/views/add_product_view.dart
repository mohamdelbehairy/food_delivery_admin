import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../core/utils/service/firebase_storage_service.dart';
import '../../../../core/utils/service/image_picker_service.dart';
import '../manager/add_product/add_product_bloc.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductBloc(
          Helper.getIt.get<ImagePickerService>(),
          Helper.getIt.get<FirebaseStorageService>(),
          Helper.getIt.get<FirebaseFirestoreService>())
        ..initTextFields(),
      child: const Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: AddProductViewBody())),
    );
  }
}
