import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../personal_data/personal_data_bloc.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final image = context.read<PersonalDataBloc>();
    return GestureDetector(
      onTap: () => image.add(PickImageEvent()),
      child: const CircleAvatar(
        radius: 16,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xffF5F5FF),
          child:
              Icon(Icons.camera_alt, size: 18, color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
