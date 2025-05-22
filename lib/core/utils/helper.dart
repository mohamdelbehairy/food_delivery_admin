import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/service/firebase_storage_service.dart';
import 'package:food_delivery_admin/core/utils/service/image_picker_service.dart';
import 'package:food_delivery_admin/core/utils/service/shared_pref_service.dart';
import 'package:food_delivery_admin/features/user_data/data/repo/user_data_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/product_data/data/repo/product_data_repo_impl.dart';

abstract class Helper {
  static OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xffE1E1E1)),
    );
  }

  // getIt service locator
  static final getIt = GetIt.instance;
  static Future<void> setupLocator() async {
    // firebase
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt
        .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

    getIt.registerSingleton<AuthRepoImpl>(
        AuthRepoImpl(getIt.get<FirebaseAuth>()));

    getIt.registerSingleton<UserDataRepoImpl>(
        UserDataRepoImpl(getIt.get<FirebaseFirestore>()));

    getIt.registerSingleton<ProductDataRepoImpl>(
        ProductDataRepoImpl(getIt.get<FirebaseFirestore>()));

    getIt.registerSingleton(
        FirebaseStorageService(getIt.get<FirebaseStorage>()));

    // shared pref
    getIt.registerLazySingletonAsync<SharedPreferences>(
        () => SharedPreferences.getInstance());
    await getIt.isReady<SharedPreferences>();

    getIt.registerSingleton<SharedPrefService>(
        SharedPrefService(getIt.get<SharedPreferences>()));

    getIt.registerSingleton<ImagePickerService>(ImagePickerService());
  }

  static void customSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
      snackBarAnimationStyle: AnimationStyle(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  static bool convertTextFieldPrice(String text) {
    final convertToNumber = num.tryParse(text);
    if ((convertToNumber == null ||
            (convertToNumber.runtimeType != int &&
                convertToNumber.runtimeType != double)) ||
        convertToNumber <= 0) {
      return true;
    }
    return false;
  }
}
