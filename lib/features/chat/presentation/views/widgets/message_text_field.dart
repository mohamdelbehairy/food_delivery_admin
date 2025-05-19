import 'package:flutter/material.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'message_text_field_button.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextField(
                textFieldModel: TextFieldModel(hintText: "Type something..."))),
        const SizedBox(width: 16),
        const MessageTextFieldButton(),
      ],
    );
  }
}
