import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../features/auth/presentation/views/welcome_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import 'constants.dart';
import 'service/shared_pref_service.dart';

Widget materialAppHome() {
  final pref = Helper.getIt.get<SharedPrefService>();
  final userID = pref.getString(Constants.userID);
  if (userID != null) return const HomeView();
  return const WelcomeView();
}
