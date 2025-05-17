import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../views/widgets/login_password_suffix_icon.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    _listenToEmail();
    on<LoginEvent>((event, emit) {
      if (event is ChangeVisibilityEvent) {
        changeVisibility = !changeVisibility;
        emit(ChangeVisibility());
      }

      if (event is LoginButtonEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        }
      }
    });

    on<ChangeEmailEvent>((event, emit) {
      final currentValidation = EmailValidator.validate(event.email);
      if (currentValidation != isValidate) {
        isValidate = currentValidation;
        emit(ChangeEmailState());
      }
    });
  }

  void _listenToEmail() {
    _email.addListener(() {
      add(ChangeEmailEvent(_email.text));
    });
  }

  bool changeVisibility = false;
  bool isValidate = false;
  
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextFieldModel> loginItems() {
    return [
      TextFieldModel(
          lable: "Email",
          hintText: "Type something longer here...",
          controller: _email,
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
          hintText: "Type something longer here...",
          controller: _password,
          obscureText: changeVisibility,
          suffixIcon: LoginPasswordSuffixIcon(),
          validator: (value) {
            if (_email.text.isEmpty || !EmailValidator.validate(_email.text)) {
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
    _email.dispose();
    _password.dispose();
    return super.close();
  }
}
