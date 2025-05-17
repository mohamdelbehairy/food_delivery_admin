part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangeVisibility extends AuthState {}

final class ChangeEmail extends AuthState {}