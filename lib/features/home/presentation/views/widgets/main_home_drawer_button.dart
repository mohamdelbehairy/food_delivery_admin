import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/alert_dialog_model.dart';
import '../../../../../core/model/button_model.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/manager/logout/logout_bloc.dart';
import '../../../../auth/presentation/views/welcome_view.dart';

class MainHomeDrawerButton extends StatelessWidget {
  const MainHomeDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final logout = context.read<LogoutBloc>();
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigation.go(context, const WelcomeView());
        }
      },
      builder: (context, state) {
        return CustomButton(
          buttonModel: ButtonModel(
            width: 200,
            buttonName: "Log Out",
            isLoading: logout.isLoading,
            onTap: () => showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                alertDialogModel: AlertDialogModel(
                  onTap: () {
                    Navigation.pop(context);
                    logout.add(LogoutButtonEvent());
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
