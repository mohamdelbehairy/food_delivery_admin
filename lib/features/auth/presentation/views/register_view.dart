import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/service/firebase_auth_service.dart';
import '../../../user_data/data/repo/user_data_repo_impl.dart';
import '../manager/register/register_bloc.dart';
import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(Helper.getIt.get<FirebaseAuthService>(),
          Helper.getIt.get<UserDataRepoImpl>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
