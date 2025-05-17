import 'package:flutter/material.dart';

import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../login_view.dart';
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
              CustomButton(
                  onTap: () => Navigation.push(context, const LoginView())),
              const SizedBox(height: 32),
              const WelcomeCreateAccount(),
            ],
          ),
        ));
  }
}
