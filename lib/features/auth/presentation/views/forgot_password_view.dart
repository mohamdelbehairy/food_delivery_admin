import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../core/utils/service/firebase_auth_service.dart';
import '../manager/forgot_password/forgot_password_bloc.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgotPasswordBloc(Helper.getIt.get<FirebaseAuthService>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: ForgotPasswordViewBody()),
      ),
    );
  }
}
