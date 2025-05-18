import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../core/utils/service/shared_pref_service.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../manager/login/login_bloc.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(Helper.getIt.get<AuthRepoImpl>(),
          Helper.getIt.get<SharedPrefService>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
