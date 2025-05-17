import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/manager/login/login_bloc.dart';
import '../utils/app_colors.dart';

class ForgotPasswordSuffixIcon extends StatelessWidget {
  const ForgotPasswordSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<LoginBloc>();
    return GestureDetector(
      onTap: () => auth.add(ChangeVisibilityEvent()),
      child: Icon(
          auth.changeVisibility
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.primaryColor,
          size: 18),
    );
  }
}
