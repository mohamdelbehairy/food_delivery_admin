part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class ChangeEmailEvent extends ForgotPasswordEvent {
  final String email;

  ChangeEmailEvent(this.email);
}

final class ForgotPasswordButtonEvent extends ForgotPasswordEvent {}
