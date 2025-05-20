import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/model/button_model.dart';
import 'package:food_delivery_admin/core/widgets/custom_button.dart';

import '../../manager/forgot_password/forgot_password_bloc.dart';
import '../../../../../core/widgets/text_field_list_view.dart';

class ForgotPasswordTextFieldAndButtonSection extends StatelessWidget {
  const ForgotPasswordTextFieldAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPassword = context.read<ForgotPasswordBloc>();
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return Form(
          key: forgotPassword.formKey,
          child: Column(
            children: [
              TextFieldListView(list: forgotPassword.forgotItems()),
              const SizedBox(height: 32),
              CustomButton(
                  buttonModel: ButtonModel(
                buttonName: "Continue",
                onTap: () => forgotPassword.add(ForgotPasswordButtonEvent()),
              )),
            ],
          ),
        );
      },
    );
  }
}
