import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_svg.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Image.asset(Assets.imagesImage),
        title: Text("Geopart Etdsien", style: Styles.semiBold14),
        subtitle: Text("Your Order Just Arrived!", style: Styles.medium12),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("13.47", style: Styles.medium12),
            const SizedBox(height: 8),
            CustomSvg(svgModel: SvgModel(image: Assets.imagesDoubleCheck)),
          ],
        ),
      ),
    );
  }
}
