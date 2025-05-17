import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/auth/auth_bloc.dart';
import 'login_forgot_password.dart';
import 'login_list_view.dart';

class LoginTextFieldAndButtonSection extends StatelessWidget {
  const LoginTextFieldAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: auth.loginFormKey,
          child: Column(
            children: [
              LoginListView(),
              const SizedBox(height: 16),
              const LoginForgotPassword(),
              const SizedBox(height: 24),
              CustomButton(onTap: () => auth.add(LoginEvent())),
            ],
          ),
        );
      },
    );
  }
}
