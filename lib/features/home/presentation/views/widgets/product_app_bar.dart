  import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_svg.dart';

AppBar productAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.white,
      leading: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: CustomSvg(
              svgModel: SvgModel(
                  onTap: () => Navigation.pop(context),
                  image: Assets.imagesArrowBack)),
        ),
      ),
      title: Text("Product Data", style: Styles.semiBold16),
    );
  }