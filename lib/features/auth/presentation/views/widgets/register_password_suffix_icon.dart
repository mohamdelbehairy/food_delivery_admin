import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../manager/register/register_bloc.dart';

class RegisterPasswordSuffixIcon extends StatelessWidget {
  const RegisterPasswordSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final register = context.read<RegisterBloc>();
    return GestureDetector(
      onTap: () => register.add(ChangeVisibilityEvent()),
      child: Icon(
          register.changeVisibility
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.primaryColor,
          size: 18),
    );
  }
}