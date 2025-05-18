import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/constants.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../../core/utils/navigation.dart';
import '../../manager/register/register_bloc.dart';
import '../login_view.dart';

void registerBlocListener(RegisterState state, BuildContext context) {
    if (state is RegisterSuccess) {
      Navigation.push(context, const LoginView());
    }
    if (state is RegisterFailure &&
        state.errorMessage == Constants.emailAlreadyInUse) {
      Helper.customSnackBar(context,
          message:
              "The email address is already in use by another account.");
    }
    if (state is RegisterFailure &&
        state.errorMessage != Constants.emailAlreadyInUse) {
      Helper.customSnackBar(context,
          message: "Oops! Something went wrong. Please try again later.");
    }
  }

