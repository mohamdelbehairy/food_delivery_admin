part of 'login_bloc.dart';

sealed class LoginEvent {}

final class ChangeVisibilityEvent extends LoginEvent {}

final class ChangeEmailEvent extends LoginEvent {
  final String email;
  ChangeEmailEvent(this.email);
}

final class LoginButtonEvent extends LoginEvent {}