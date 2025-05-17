import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/register/register_bloc.dart';

class RegisterAgreeAndPrivacyBox extends StatelessWidget {
  const RegisterAgreeAndPrivacyBox({super.key});

  @override
  Widget build(BuildContext context) {
    final register = context.read<RegisterBloc>();
    return Row(
      children: [
        GestureDetector(
          onTap: () => register.add(ChangePrivacyEvent()),
          child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  color: register.isPrivacy
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  border: Border.all(
                      color: register.isPrivacy
                          ? Colors.transparent
                          : AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(2)),
              child: Icon(Icons.done, size: 18, color: Colors.white)),
        ),
        const SizedBox(width: 8),
        const Text("Agree the terms of use and privacy policy",
            style: Styles.semiBold14),
      ],
    );
  }
}
