import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/service/firebase_auth_service.dart';
import '../../views/widgets/email_suffix_icon.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final FirebaseAuthService _firebaseAuthService;
  ForgotPasswordBloc(this._firebaseAuthService)
      : super(ForgotPasswordInitial()) {
    _listenToEmail();
    on<ForgotPasswordEvent>((event, emit) async {
      if (event is ForgotPasswordButtonEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          isLoading = true;
          emit(ForgotpasswordLoading());
          await _firebaseAuthService.forgotPassword(_email.text).then((value) {
            isLoading = false;
            emit(ForgotpasswordSuccess());
          }).catchError((error) {
            log("error from forgot password: $error");
            isLoading = false;
            emit(ForgotpasswordFailure(error.code));
          });
        }
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

  bool _isValidate = false;
  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextFieldModel> forgotItems() {
    return [
      TextFieldModel(
          lable: "Email",
          hintText: "Type something longer here...",
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: _isValidate ? const EmailSuffixIcon() : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!EmailValidator.validate(value)) {
              return 'Please enter a valid email';
            }
            return null;
          })
    ];
  }

  @override
  Future<void> close() {
    _email.dispose();
    return super.close();
  }
}
