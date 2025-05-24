import 'package:flutter/material.dart';

import '../model/svg_model.dart';
import '../utils/assets.dart';
import '../utils/navigation.dart';
import '../utils/styles.dart';
import 'custom_svg.dart';

AppBar customAppBar(BuildContext context, {String? title}) {
  return AppBar(
    centerTitle: true,
    scrolledUnderElevation: 0.0,
    backgroundColor: Colors.white,
    leading: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CustomSvg(
            svgModel: SvgModel(
                onTap: () => Navigation.pop(context),
                image: Assets.imagesArrowBack)),
      ),
    ),
    title: Text(title ?? "Product Data", style: Styles.semiBold16),
  );
}
