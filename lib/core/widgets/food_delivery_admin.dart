import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/manager/home/home_bloc.dart';
import '../../features/product_data/data/repo/product_data_repo_impl.dart';
import '../utils/helper.dart';
import '../utils/material_app_home.dart';

class FoodDeliveryAdmin extends StatelessWidget {
  const FoodDeliveryAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(Helper.getIt.get<ProductDataRepoImpl>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: materialAppHome(),
      ),
    );
  }
}
