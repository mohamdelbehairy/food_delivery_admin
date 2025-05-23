part of 'logout_bloc.dart';

sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {}

final class LogoutFailure extends LogoutState {
  final String errorMessage;
  LogoutFailure(this.errorMessage);
}
