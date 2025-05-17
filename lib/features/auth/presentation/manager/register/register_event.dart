part of 'register_bloc.dart';

sealed class RegisterEvent {}

final class ChangeVisibilityEvent extends RegisterEvent {}

final class ChangeEmailEvent extends RegisterEvent {
  final String email;
  ChangeEmailEvent(this.email);
}

final class ChangePrivacyEvent extends RegisterEvent {}

final class RegisterButtonEvent extends RegisterEvent {}
