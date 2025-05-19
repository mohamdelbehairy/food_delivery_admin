import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_svg.dart';

class MessageTextFieldButton extends StatelessWidget {
  const MessageTextFieldButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: CustomSvg(svgModel: SvgModel(image: Assets.imagesSend)),
      ),
    );
  }
}