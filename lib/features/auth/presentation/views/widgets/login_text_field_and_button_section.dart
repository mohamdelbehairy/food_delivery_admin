import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/login/login_bloc.dart';
import 'text_field_list_view.dart';
import 'login_forgot_password.dart';

class LoginTextFieldAndButtonSection extends StatelessWidget {
  const LoginTextFieldAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final login = context.read<LoginBloc>();
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: login.formKey,
          child: Column(
            children: [
              TextFieldListView(list: login.loginItems()),
              const SizedBox(height: 16),
              const LoginForgotPassword(),
              const SizedBox(height: 24),
              CustomButton(onTap: () => login.add(LoginButtonEvent())),
            ],
          ),
        );
      },
    );
  }
}
