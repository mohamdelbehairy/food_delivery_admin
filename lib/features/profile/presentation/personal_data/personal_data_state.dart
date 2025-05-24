part of 'personal_data_bloc.dart';

sealed class PersonalDataState {}

final class PersonalDataInitial extends PersonalDataState {}

final class PickImageSuccess extends PersonalDataState {}

final class UpdateUserDataLoading extends PersonalDataState {}

final class UpdateUserDataSuccess extends PersonalDataState {}

final class UpdateUserDataFailure extends PersonalDataState {
  final String errorMessage;
  UpdateUserDataFailure(this.errorMessage);
}

final class CancleChanges extends PersonalDataState {}
