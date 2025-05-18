import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../../core/widgets/custom_arrow_back.dart';
import '../../manager/forgot_password/forgot_password_bloc.dart';
import 'forgot_password_header.dart';
import 'forgot_password_text_field_and_button_section.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotpasswordSuccess) {
          Helper.customSnackBar(context,
              message: "Email sent successfully please check your email.");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomArrowBack(),
            const ForgotPasswordHeader(),
            const SizedBox(height: 24),
            const ForgotPasswordTextFieldAndButtonSection(),
          ],
        ),
      ),
    );
  }
}
