part of 'personal_data_bloc.dart';

sealed class PersonalDataEvent {}

final class PickImageEvent extends PersonalDataEvent {}

final class CancleChangeEvent extends PersonalDataEvent {
  final UserDataModel userData;
  CancleChangeEvent({required this.userData});
}