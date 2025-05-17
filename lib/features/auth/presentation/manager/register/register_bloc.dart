import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../views/widgets/register_password_suffix_icon.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    _listenToEmail();
    on<RegisterEvent>((event, emit) {
      if (event is ChangeVisibilityEvent) {
        changeVisibility = !changeVisibility;
        emit(ChangeVisibility());
      }

      if (event is RegisterButtonEvent) {
        if (isPrivacy) {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
        }
      }

      if (event is ChangePrivacyEvent) {
        isPrivacy = !isPrivacy;
        emit(ChangePrivacyState());
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
  bool isPrivacy = false;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextFieldModel> registerItems() {
    return [
      TextFieldModel(
          lable: "Name",
          hintText: "Type something longer here...",
          controller: _name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          }),
      TextFieldModel(
          lable: "Email",
          hintText: "Type something longer here...",
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: isValidate
              ? Icon(Icons.done, size: 18, color: const Color(0xff34A353))
              : null,
          validator: (value) {
            if (_name.text.isEmpty) return null;
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
          suffixIcon: RegisterPasswordSuffixIcon(),
          validator: (value) {
            if (_name.text.isEmpty ||
                _email.text.isEmpty ||
                !EmailValidator.validate(_email.text)) {
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
