import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/user_data/data/repo/user_data_repo_impl.dart';
import 'service/firebase_auth_service.dart';
import 'service/firebase_firestore_service.dart';
import 'service/firebase_storage_service.dart';
import 'service/image_picker_service.dart';
import 'service/shared_pref_service.dart';

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

    // shared pref
    getIt.registerLazySingletonAsync<SharedPreferences>(
        () => SharedPreferences.getInstance());
    await getIt.isReady<SharedPreferences>();

    // user data impl
    getIt.registerSingleton<UserDataRepoImpl>(
        UserDataRepoImpl(getIt.get<FirebaseFirestore>()));

    // services
    getIt.registerSingleton<FirebaseAuthService>(
        FirebaseAuthService(getIt.get<FirebaseAuth>()));

    getIt.registerSingleton<FirebaseFirestoreService>(
        FirebaseFirestoreService(getIt.get<FirebaseFirestore>()));

    getIt.registerSingleton(
        FirebaseStorageService(getIt.get<FirebaseStorage>()));

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
