import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/widgets/custom_button.dart';

import '../../../../../core/utils/styles.dart';
import 'welcome_create_account.dart';

class WelcomeViewButtons extends StatelessWidget {
  const WelcomeViewButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text("Existing  customer / Get started",
                  style: Styles.semiBold16),
              const SizedBox(height: 12),
              const CustomButton(),
              const SizedBox(height: 32),
              const WelcomeCreateAccount(),
            ],
          ),
        ));
  }
}


