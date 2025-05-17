import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/register/register_bloc.dart';
import 'register_agree_and_privacy_box.dart';
import 'text_field_list_view.dart';

class RegisterTextFieldAndButtonSection extends StatelessWidget {
  const RegisterTextFieldAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final register = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Form(
          key: register.formKey,
          child: Column(
            children: [
              TextFieldListView(list: register.registerItems()),
              const SizedBox(height: 24),
              RegisterAgreeAndPrivacyBox(),
              const SizedBox(height: 24),
              CustomButton(
                  buttonName: "Sign up",
                  onTap: () => register.add(RegisterButtonEvent())),
            ],
          ),
        );
      },
    );
  }
}
