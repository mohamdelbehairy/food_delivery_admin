import 'package:flutter/material.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class AuthTextFieldSection extends StatelessWidget {
  const AuthTextFieldSection({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textFieldModel.lable, style: Styles.semiBold14),
        const SizedBox(height: 8),
        CustomTextField(textFieldModel: textFieldModel),
      ],
    );
  }
}
