import 'package:flutter/material.dart';

import '../../../../../core/model/text_field_model.dart';
import 'auth_text_field_section.dart';

class TextFieldListView extends StatelessWidget {
  const TextFieldListView({super.key, required this.list});
  final List<TextFieldModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 24,
        children:
            list.map((e) => AuthTextFieldSection(textFieldModel: e)).toList());
  }
}
