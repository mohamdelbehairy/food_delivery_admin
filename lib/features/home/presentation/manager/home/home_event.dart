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

final class CategoryButtonEvent extends HomeEvent {}

final class SelectProductCategoryEvent extends HomeEvent {
  final int index;
  SelectProductCategoryEvent(this.index);
}

final class GetProductDateEvent extends HomeEvent {
  final List<ProductDataModel> productList;

  GetProductDateEvent(this.productList);
}

final class GetUserDataEvent extends HomeEvent {
  final UserDataModel userData;

  GetUserDataEvent(this.userData);
}
