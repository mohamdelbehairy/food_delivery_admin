import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../widgets/food_delivery_admin.dart';
import 'bloc_observer.dart';
import 'firebase_options.dart';

Future<void> initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserv();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Helper.setupLocator();

  runApp(const FoodDeliveryAdmin());
}
