import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_svg.dart';

class MessageViewHeader extends StatelessWidget {
  const MessageViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSvg(
            svgModel: SvgModel(
                onTap: () => Navigation.pop(context),
                image: Assets.imagesArrowBack)),
        const Text("Stevano Clirover", style: Styles.semiBold14),
        CustomSvg(
            svgModel: SvgModel(
          image: Assets.imagesCall,
          onTap: () => Helper.customSnackBar(context,
              message: "This feature is comming soon."),
        ))
      ],
    );
  }
}
