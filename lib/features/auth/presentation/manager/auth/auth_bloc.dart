import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/widgets/text_field_suffix_icon.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    _listenToEmailLogin();
    on<AuthEvent>((event, emit) {
      if (event is ChangeVisibilityEvent) {
        changeVisibility = !changeVisibility;
        emit(ChangeVisibility());
      }

      if (event is LoginEvent) {
        if (loginFormKey.currentState!.validate()) {
          loginFormKey.currentState!.save();
        }
      }
    });

    on<ChangeEmailEvent>((event, emit) {
      final currentValidation = EmailValidator.validate(event.email);
      if (currentValidation != isValidate) {
        isValidate = currentValidation;
        emit(ChangeEmail());
      }
    });
  }

  void _listenToEmailLogin() {
    _emailLogin.addListener(() {
      add(ChangeEmailEvent(_emailLogin.text));
    });
  }

  // login view
  bool changeVisibility = false;
  bool isValidate = false;
  final TextEditingController _emailLogin = TextEditingController();
  final TextEditingController _passwordLogin = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  List<TextFieldModel> loginTextFields() {
    return [
      TextFieldModel(
          lable: "Email",
          hintText: "Enter your email",
          controller: _emailLogin,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: isValidate
              ? Icon(Icons.done, size: 18, color: const Color(0xff34A353))
              : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!EmailValidator.validate(value)) {
              return 'Please enter a valid email';
            }
            return null;
          }),
      TextFieldModel(
          lable: "Password",
          hintText: "Enter your password",
          controller: _passwordLogin,
          obscureText: changeVisibility,
          suffixIcon: ForgotPasswordSuffixIcon(),
          validator: (value) {
            if (_emailLogin.text.isEmpty ||
                !EmailValidator.validate(_emailLogin.text)) {
              return null;
            }
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
          }),
    ];
  }

  @override
  Future<void> close() {
    _emailLogin.dispose();
    _passwordLogin.dispose();
    return super.close();
  }
}
