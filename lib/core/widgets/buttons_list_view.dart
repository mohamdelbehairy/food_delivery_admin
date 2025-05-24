import 'package:flutter/material.dart';

import '../model/button_model.dart';
import 'custom_button.dart';

class ButtonsListView extends StatelessWidget {
  const ButtonsListView({super.key, required this.buttons});

  final List<ButtonModel> buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: buttons.map((e) => CustomButton(buttonModel: e)).toList(),
    );
  }
}