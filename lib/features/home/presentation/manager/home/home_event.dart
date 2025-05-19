part of 'home_bloc.dart';

sealed class HomeEvent {}

final class ChangeBottomNavEvent extends HomeEvent {
  final int index;

  ChangeBottomNavEvent(this.index);
}

final class ChangeCategoryEvent extends HomeEvent {
  final int index;

  ChangeCategoryEvent(this.index);
}
