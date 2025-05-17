part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class ChangeVisibilityEvent extends AuthEvent {}

final class ChangeEmailEvent extends AuthEvent {
  final String email;
  ChangeEmailEvent(this.email);
}

final class LoginEvent extends AuthEvent {}
