import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_svg.dart';

class ProductItemDistance extends StatelessWidget {
  const ProductItemDistance({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvg(
            svgModel: SvgModel(
                image: Assets.imagesLocation,
                color: AppColors.primaryColor,
                height: 14)),
        const SizedBox(width: 6),
        Text("190m",
            style: Styles.medium12.copyWith(color: AppColors.blackColor)),
      ],
    );
  }
}

