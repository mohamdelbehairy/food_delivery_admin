import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/features/home/presentation/manager/home/home_bloc.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_svg.dart';
import 'main_home_header_menu.dart';

class MainHomeHeaderNotificationAndMenu extends StatelessWidget {
  const MainHomeHeaderNotificationAndMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeBloc>();
    return Positioned(
        right: 24,
        top: 12,
        child: SafeArea(
          child: Row(
            children: [
              CustomSvg(svgModel: SvgModel(image: Assets.imagesNotification)),
              const SizedBox(width: 16),
              MainHomeHeaderMenu(
                  onTap: () => home.homeKey.currentState?.openDrawer()),
            ],
          ),
        ));
  }
}
