import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';

import '../model/button_model.dart';
import '../utils/navigation.dart';
import 'custom_button.dart';

class AlertDialogButtons extends StatelessWidget {
  const AlertDialogButtons(
      {super.key, required this.onTap, required this.buttonName});
  final String buttonName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
            buttonModel: ButtonModel(
                height: 48,
                width: 130,
                onTap: () => Navigation.pop(context),
                backgroundColor: Colors.white,
                child: Center(
                    child: Text("Cancel",
                        style: Styles.semiBold14
                            .copyWith(color: const Color(0xff101010)))),
                borderColor: const Color(0xffD6D6D6))),
        const SizedBox(width: 12),
        CustomButton(
            buttonModel: ButtonModel(
                height: 48, width: 130, buttonName: buttonName, onTap: onTap)),
      ],
    );
  }
}
