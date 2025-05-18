import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import 'service/firebase_service.dart';

abstract class Helper {
  static OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xffE1E1E1)),
    );
  }

  // getIt service locator
  static final getIt = GetIt.instance;
  static void setupLocator() {
    getIt.registerSingleton<FirebaseService>(FirebaseService());
    getIt.registerSingleton<AuthRepoImpl>(
        AuthRepoImpl(getIt.get<FirebaseService>()));
  }

  static void customSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
