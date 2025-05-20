import 'package:flutter/material.dart';

import '../model/text_field_model.dart';
import '../utils/styles.dart';
import 'custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textFieldModel.lable!, style: Styles.semiBold14),
        const SizedBox(height: 8),
        CustomTextField(textFieldModel: textFieldModel),
      ],
    );
  }
}
