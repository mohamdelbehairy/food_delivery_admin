import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_svg.dart';

class AlProductsViewHeader extends StatelessWidget {
  const AlProductsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSvg(
              svgModel: SvgModel(
                  onTap: () => Navigation.pop(context),
                  image: Assets.imagesArrowBack)),
          const Text("All Products", style: Styles.semiBold16),
          const Text("", style: Styles.semiBold14),
        ],
      ),
    );
  }
}