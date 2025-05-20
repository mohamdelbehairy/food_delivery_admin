import 'package:flutter/material.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'product_bottom_sheet_divider.dart';
import 'product_bottom_sheet_list_view.dart';

class ProductCategoryBottomSheet extends StatelessWidget {
  const ProductCategoryBottomSheet({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const ProductBottomSheetDivider(),
            const SizedBox(height: 16),
            const Text("Select Category", style: Styles.semiBold16),
            const SizedBox(height: 28),
            const ProductBottomSheetListView(),
            const SizedBox(height: 32),
            CustomButton(
                buttonModel: ButtonModel(buttonName: "Select", onTap: onTap)),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
