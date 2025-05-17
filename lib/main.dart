import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/bloc_observer.dart';
import 'core/widgets/food_delivery_admin.dart';

void main() {
  Bloc.observer = BlocObserv();
  runApp(const FoodDeliveryAdmin());
}
