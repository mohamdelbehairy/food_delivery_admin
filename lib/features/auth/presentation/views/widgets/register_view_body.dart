import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_arrow_back.dart';
import 'register_header.dart';
import 'register_text_field_and_button_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomArrowBack(),
          const RegisterHeader(),
          const SizedBox(height: 24),
          const RegisterTextFieldAndButtonSection(),
        ],
      ),
    );
  }
}
