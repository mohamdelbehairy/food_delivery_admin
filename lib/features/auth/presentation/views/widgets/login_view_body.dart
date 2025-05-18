import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_arrow_back.dart';
import '../../manager/login/login_bloc.dart';
import 'login_bloc_listener.dart';
import 'login_header.dart';
import 'login_text_field_and_button_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        loginBlocListener(state, context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomArrowBack(),
            const LoginHeader(),
            const SizedBox(height: 24),
            const LoginTextFieldAndButtonSection(),
          ],
        ),
      ),
    );
  }
}
