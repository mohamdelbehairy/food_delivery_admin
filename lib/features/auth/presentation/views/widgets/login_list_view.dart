import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/auth/auth_bloc.dart';
import 'auth_text_field_section.dart';

class LoginListView extends StatelessWidget {
  const LoginListView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return Column(
        spacing: 24,
        children: auth
            .loginTextFields()
            .map((e) => AuthTextFieldSection(textFieldModel: e))
            .toList());
  }
}
