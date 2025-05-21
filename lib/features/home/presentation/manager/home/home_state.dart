part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeBottomNav extends HomeState {}

final class ChangeCategory extends HomeState {}

final class ChangeCategoryProduct extends HomeState {}

final class GetProductDataSuccess extends HomeState {}