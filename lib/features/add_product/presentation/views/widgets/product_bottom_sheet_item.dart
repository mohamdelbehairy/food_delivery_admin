import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/app_colors.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_svg.dart';
import '../../../data/model/product_bottom_sheet_item_model.dart';

class ProductBottomSheetItem extends StatelessWidget {
  const ProductBottomSheetItem(
      {super.key, required this.productItemModel, required this.isActive});
  final ProductBottomSheetItemModel productItemModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  isActive ? AppColors.primaryColor : const Color(0xffEAEAEA)),
          borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: Color(0xffF3F6FB),
          child: Image.asset(productItemModel.image),
        ),
        title: Text(productItemModel.title, style: Styles.semiBold14),
        trailing: isActive
            ? CustomSvg(
                svgModel: SvgModel(
                    image: Assets.imagesDone, color: AppColors.primaryColor))
            : null,
      ),
    );
  }
}
