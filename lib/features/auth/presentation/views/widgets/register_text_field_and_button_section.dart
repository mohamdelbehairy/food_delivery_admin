import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/model/button_model.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/register/register_bloc.dart';
import 'register_agree_and_privacy_box.dart';
import '../../../../../core/widgets/text_field_list_view.dart';

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
                  buttonModel: ButtonModel(
                buttonName: "Sign up",
                isLoading: register.isLoading,
                onTap: () => register.add(RegisterButtonEvent()),
              )),
            ],
          ),
        );
      },
    );
  }
}
