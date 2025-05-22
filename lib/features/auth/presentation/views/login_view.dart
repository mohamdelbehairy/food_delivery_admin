import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../core/utils/service/firebase_auth_service.dart';
import '../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../core/utils/service/shared_pref_service.dart';
import '../manager/login/login_bloc.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          Helper.getIt.get<FirebaseAuthService>(),
          Helper.getIt.get<FirebaseFirestoreService>(),
          Helper.getIt.get<SharedPrefService>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
