import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/model/button_model.dart';
import 'package:food_delivery_admin/core/model/text_field_model.dart';
import 'package:food_delivery_admin/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_arrow_back.dart';
import 'auth_text_field_section.dart';
import 'forgot_password_header.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomArrowBack(),
          const ForgotPasswordHeader(),
          const SizedBox(height: 24),
          AuthTextFieldSection(
              textFieldModel: TextFieldModel(
                  lable: "Email", hintText: "Type something longer here...")),
          const SizedBox(height: 32),
          CustomButton(buttonModel: ButtonModel(buttonName: "Continue")),
        ],
      ),
    );
  }
}
