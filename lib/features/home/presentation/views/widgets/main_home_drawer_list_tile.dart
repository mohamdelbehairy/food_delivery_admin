import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_svg.dart';
import '../../../../profile/data/model/user_data_model.dart';
import '../../../../profile/presentation/views/personal_data_view.dart';

class MainHomeDrawerListTile extends StatelessWidget {
  const MainHomeDrawerListTile({super.key, required this.userDataModel});
  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          Navigation.push(context, PersonalDataView(userData: userDataModel)),
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
            color: const Color(0xffF5F5FF),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: CustomSvg(
                svgModel: SvgModel(
                    image: Assets.imagesPersonalData,
                    color: AppColors.blackColor))),
      ),
      title: Text("Personal Data",
          style: Styles.medium14.copyWith(color: AppColors.blackColor)),
      trailing: Transform.rotate(
        angle: 180 * 3.14 / 180,
        child: Icon(Icons.arrow_back_ios_new,
            size: 18, color: AppColors.blackColor),
      ),
    );
  }
}
