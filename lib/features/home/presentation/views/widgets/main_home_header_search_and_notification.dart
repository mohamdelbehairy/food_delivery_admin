import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_svg.dart';

class MainHomeHeaderSearchAndNotification extends StatelessWidget {
  const MainHomeHeaderSearchAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 24,
        top: 12,
        child: SafeArea(
          child: Row(
            children: [
              CustomSvg(svgModel: SvgModel(image: Assets.imagesSearch)),
              const SizedBox(width: 16),
              CustomSvg(svgModel: SvgModel(image: Assets.imagesNotification)),
            ],
          ),
        ));
  }
}
