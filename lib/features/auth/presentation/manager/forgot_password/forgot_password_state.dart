part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ChangeEmailState extends ForgotPasswordState {}

final class ForgotpasswordLoading extends ForgotPasswordState {}

final class ForgotpasswordSuccess extends ForgotPasswordState {}

final class ForgotpasswordFailure extends ForgotPasswordState {
  final String message;
  ForgotpasswordFailure( this.message);
}