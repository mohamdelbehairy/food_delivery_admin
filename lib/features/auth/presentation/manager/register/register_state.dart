part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class ChangeVisibility extends RegisterState {}

final class ChangeEmailState extends RegisterState {}

final class ChangePrivacyState extends RegisterState {}
