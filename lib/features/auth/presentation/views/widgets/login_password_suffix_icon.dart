import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/login/login_bloc.dart';
import '../../../../../core/utils/app_colors.dart';

class LoginPasswordSuffixIcon extends StatelessWidget {
  const LoginPasswordSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final login = context.read<LoginBloc>();
    return GestureDetector(
      onTap: () => login.add(ChangeVisibilityEvent()),
      child: Icon(
          login.changeVisibility
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.primaryColor,
          size: 18),
    );
  }
}
