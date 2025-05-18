import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/styles.dart';
import '../register_view.dart';

class WelcomeCreateAccount extends StatelessWidget {
  const WelcomeCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("New customer? ", style: Styles.semiBold16),
        GestureDetector(
          onTap: () => Navigation.push(context, const RegisterView()),
          child: Text("Create new account",
              style: Styles.semiBold16.copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
