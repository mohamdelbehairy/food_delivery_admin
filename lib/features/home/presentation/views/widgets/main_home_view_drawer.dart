import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/service/firebase_auth_service.dart';
import '../../../../../core/utils/service/shared_pref_service.dart';
import '../../../../auth/presentation/manager/logout/logout_bloc.dart';
import '../../../../profile/presentation/views/widgets/profile_user_image.dart';
import '../../../../profile/presentation/views/widgets/profile_user_name_and_email.dart';
import '../../manager/home/home_bloc.dart';
import 'main_home_drawer_button.dart';

class MainHomeViewDrawer extends StatelessWidget {
  const MainHomeViewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeBloc>();
    return BlocProvider(
      create: (context) => LogoutBloc(Helper.getIt.get<FirebaseAuthService>(),
          Helper.getIt.get<SharedPrefService>()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Drawer(
            backgroundColor: Colors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Welcome back, ${home.userData?.userName.split(' ').first} 👋',
                            style: Styles.bold16)),
                    const SizedBox(height: 24),
                    ProfileUserImage(imageUrl: home.userData?.userImage),
                    const SizedBox(height: 24),
                    ProfileUserNameAndEmail(
                        userName: home.userData!.userName,
                        userEmail: home.userData!.userEmail),
                    Spacer(),
                    const MainHomeDrawerButton(),
                    const SizedBox(height: 24)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
