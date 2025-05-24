part of 'personal_data_bloc.dart';

sealed class PersonalDataEvent {}

final class PickImageEvent extends PersonalDataEvent {}

final class UpdateChangeEvent extends PersonalDataEvent {
  final UserDataModel userData;
  UpdateChangeEvent({required this.userData});
}

final class CancleChangeEvent extends PersonalDataEvent {
  final UserDataModel userData;
  CancleChangeEvent({required this.userData});
}