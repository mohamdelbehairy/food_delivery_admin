import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
