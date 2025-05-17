part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangeVisibility extends LoginState {}

final class ChangeEmailState extends LoginState {}
