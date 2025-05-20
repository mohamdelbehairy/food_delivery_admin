import 'package:flutter/material.dart';

import '../model/text_field_model.dart';
import 'text_field_section.dart';

class TextFieldListView extends StatelessWidget {
  const TextFieldListView({super.key, required this.list});
  final List<TextFieldModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 24,
        children:
            list.map((e) => TextFieldSection(textFieldModel: e)).toList());
  }
}
