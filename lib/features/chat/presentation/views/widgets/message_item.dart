import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_svg.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, this.isFriend = false});
  final bool isFriend;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isFriend ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
            height: 32,
            width: 223,
            decoration: BoxDecoration(
                color:
                    isFriend ? const Color(0xffF3F4F7) : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text("Okay, for what level of spiciness?",
                  style: Styles.medium12.copyWith(
                      color: isFriend ? AppColors.blackColor : Colors.white)),
            )),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment:
              isFriend ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (isFriend) const SizedBox(width: 4),
            Text("09.15",
                style:
                    Styles.medium10.copyWith(color: const Color(0xff878787))),
            if (!isFriend) const SizedBox(width: 4),
            if (!isFriend)
              CustomSvg(
                  svgModel: SvgModel(
                      image: Assets.imagesDoubleCheck,
                      color: AppColors.primaryColor)),
            const SizedBox(width: 2),
          ],
        ),
      ],
    );
  }
}
