import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/constants.dart';
import 'package:food_delivery_admin/features/auth/presentation/views/widgets/email_suffix_icon.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../data/repo/auth_repo.dart';
import '../../views/widgets/register_password_suffix_icon.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepo _authRepo;
  RegisterBloc(this._authRepo) : super(RegisterInitial()) {
    _listenToEmail();
    on<RegisterEvent>((event, emit) async {
      if (event is ChangeVisibilityEvent) {
        changeVisibility = !changeVisibility;
        emit(ChangeVisibility());
      }

      if (event is RegisterButtonEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          if (isPrivacy) {
            isLoading = true;
            emit(RegisterLoading());
            await _authRepo.register(_email.text, _password.text).then((value) {
              if (value != null) {
                isLoading = false;
                emit(RegisterSuccess());
              }
            }).catchError((error) {
              log("error from register: $error");
              isLoading = false;
              if (error.code == Constants.emailAlreadyInUse) {
                emit(RegisterFailure(Constants.emailAlreadyInUse));
              } else {
                emit(RegisterFailure(error.code));
              }
            });
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
      if (currentValidation != _isValidate) {
        _isValidate = currentValidation;
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
  bool _isValidate = false;
  bool isPrivacy = false;
  bool isLoading = false;

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
          suffixIcon: _isValidate ? const EmailSuffixIcon() : null,
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
    _name.dispose();
    _email.dispose();
    _password.dispose();
    return super.close();
  }
}
