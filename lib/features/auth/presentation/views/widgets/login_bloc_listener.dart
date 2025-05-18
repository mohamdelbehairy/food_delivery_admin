import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../manager/login/login_bloc.dart';

void loginBlocListener(LoginState state, BuildContext context) {
  if (state is LoginSuccess) {
    Navigation.go(context, const HomeView());
  }
  if (state is LoginFailure &&
      state.errorMessage == Constants.invalidCredential) {
    Helper.customSnackBar(context,
        message: "Invalid email or password. Please try again.");
  }
  if (state is LoginFailure && state.errorMessage == Constants.notAdmin) {
    Helper.customSnackBar(context, message: "This is not an admin account.");
  }
  if (state is LoginFailure &&
      state.errorMessage != Constants.invalidCredential &&
      state.errorMessage != Constants.notAdmin) {
    Helper.customSnackBar(context,
        message: "Oops! Something went wrong. Please try again later.");
  }
}
